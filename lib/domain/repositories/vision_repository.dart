import '../entities/detection.dart';

abstract class VisionRepository {
  Stream<List<Detection>> streamDetections();
}
