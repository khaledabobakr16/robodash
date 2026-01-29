import '../../domain/entities/detection.dart';

class DetectionModel extends Detection {
  DetectionModel({required super.label, required super.confidence});

  factory DetectionModel.fromJson(Map<String, dynamic> json) {
    return DetectionModel(
      label: json['label'],
      confidence: (json['confidence'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'confidence': confidence};
  }
}
