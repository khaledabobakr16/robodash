import 'package:robodash/domain/entities/detection.dart';

sealed class VisionState {}

class VisionInitial extends VisionState {}

class VisionLoading extends VisionState {}

class VisionLoaded extends VisionState {
  final List<Detection> detections;

  VisionLoaded(this.detections);
}

class VisionError extends VisionState {
  final String message;

  VisionError(this.message);
}
