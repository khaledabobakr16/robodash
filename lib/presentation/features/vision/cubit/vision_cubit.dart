import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robodash/data/datasources/ml_kit_vision_data_source.dart';

import 'vision_state.dart';

class VisionCubit extends Cubit<VisionState> {
  final MLKitVisionDataSource dataSource;

  CameraController? _cameraController;
  CameraDescription? _cameraDescription;

  bool _isProcessing = false;

  VisionCubit({required this.dataSource}) : super(VisionInitial());

  CameraController? get cameraController => _cameraController;

  Future<void> start() async {
    try {
      emit(VisionLoading());

      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        emit(VisionError('No camera found'));
        return;
      }

      _cameraDescription = cameras.first;

      _cameraController = CameraController(
        _cameraDescription!,
        ResolutionPreset.low,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );

      await _cameraController!.initialize();

      await _cameraController!.startImageStream(_onNewCameraFrame);

      emit(VisionLoaded(const []));
    } catch (e) {
      emit(VisionError(e.toString()));
    }
  }

  void _onNewCameraFrame(CameraImage image) async {
    if (_isProcessing || isClosed) return;
    _isProcessing = true;

    try {
      final detections = await dataSource.processImage(
        image,
        _cameraDescription!,
      );

      if (!isClosed) {
        emit(VisionLoaded(detections));

        if (detections.isNotEmpty) {
          final d = detections.first;
          final confidence = (d.confidence * 100).toStringAsFixed(0);

          // mqttService.publish(
          //   'robot/vision',
          //   'Detected ${d.label} ($confidence%)',
          // );

          log('Robot event stream  Detected ${d.label} ($confidence%)');
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(VisionError(e.toString()));
      }
    } finally {
      _isProcessing = false;
    }
  }

  Future<void> stop() async {
    try {
      if (_cameraController != null) {
        if (_cameraController!.value.isStreamingImages) {
          await _cameraController!.stopImageStream();
        }
        await _cameraController!.dispose();
      }
    } catch (_) {}
    _cameraController = null;
    _cameraDescription = null;
    emit(VisionInitial());
  }

  @override
  Future<void> close() async {
    await stop();
    dataSource.dispose();
    return super.close();
  }
}
