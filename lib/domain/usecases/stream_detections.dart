import '../entities/detection.dart';
import '../repositories/vision_repository.dart';

class StreamDetections {
  final VisionRepository repository;

  StreamDetections(this.repository);

  Stream<List<Detection>> call() {
    return repository.streamDetections();
  }
}
