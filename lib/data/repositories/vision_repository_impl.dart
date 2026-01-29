import 'dart:async';

import 'package:robodash/data/datasources/ml_kit_vision_data_source.dart';
import 'package:robodash/domain/entities/detection.dart';
import 'package:robodash/domain/repositories/vision_repository.dart';

class VisionRepositoryImpl implements VisionRepository {
  final MLKitVisionDataSource dataSource;

  VisionRepositoryImpl(this.dataSource);

  @override
  Stream<List<Detection>> streamDetections() async* {
    final controller = StreamController<List<Detection>>();

    Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      final detections = [
        Detection(label: 'person', confidence: 0.9),
        Detection(label: 'chair', confidence: 0.8),
      ];

      controller.add(detections);
    });

    yield* controller.stream;
  }
}
