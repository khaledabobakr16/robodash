import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

import '../../domain/entities/detection.dart';

class MLKitVisionDataSource {
  late final ObjectDetector _detector;

  MLKitVisionDataSource() {
    final options = ObjectDetectorOptions(
      mode: DetectionMode.stream,
      classifyObjects: true,
      multipleObjects: true,
    );

    _detector = ObjectDetector(options: options);
  }

  // Process camera image and return detected objects
  Future<List<Detection>> processImage(
    CameraImage image,
    CameraDescription camera,
  ) async {
    try {
      final inputImage = _convertCameraImage(image, camera);
      if (inputImage == null) return const [];

      final objects = await _detector.processImage(inputImage);

      return objects
          .where(
            (obj) => obj.labels.isNotEmpty && obj.labels.first.confidence > 0.5,
          )
          .map((obj) {
            final label = obj.labels.first.text;
            final confidence = obj.labels.first.confidence;

            return Detection(
              label: label,
              confidence: confidence,
              boundingBox: obj.boundingBox,
            );
          })
          .toList();
    } catch (e) {
      return const [];
    }
  }

  // Convert camera image to  input image
  InputImage? _convertCameraImage(CameraImage image, CameraDescription camera) {
    try {
      final WriteBuffer buffer = WriteBuffer();
      for (final Plane plane in image.planes) {
        buffer.putUint8List(plane.bytes);
      }

      final Uint8List bytes = buffer.done().buffer.asUint8List();

      final InputImageMetadata metadata = InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: _rotationFromCamera(camera),
        format: InputImageFormat.nv21,
        bytesPerRow: image.planes.first.bytesPerRow,
      );

      return InputImage.fromBytes(bytes: bytes, metadata: metadata);
    } catch (_) {
      return null;
    }
  }

  /// Camera sensor to MLKit rotation
  InputImageRotation _rotationFromCamera(CameraDescription camera) {
    switch (camera.sensorOrientation) {
      case 90:
        return InputImageRotation.rotation90deg;
      case 180:
        return InputImageRotation.rotation180deg;
      case 270:
        return InputImageRotation.rotation270deg;
      default:
        return InputImageRotation.rotation0deg;
    }
  }

  void dispose() {
    _detector.close();
  }
}
