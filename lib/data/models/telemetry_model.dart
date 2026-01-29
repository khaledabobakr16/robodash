import '../../domain/entities/telemetry.dart';

class TelemetryModel extends Telemetry {
  TelemetryModel({
    required super.battery,
    required super.temperature,
    required super.speed,
    required super.mode,
    required super.timestamp,
    required super.connectionState,
    super.errorCode,
  });

  factory TelemetryModel.fromJson(Map<String, dynamic> json) {
    return TelemetryModel(
      battery: json['battery'],
      temperature: json['temperature'],
      speed: json['speed'],
      mode: json['mode'],
      timestamp: DateTime.parse(json['timestamp']),
      connectionState: RobotConnectionState.values.firstWhere(
        (e) => e.name == json['connectionState'],
        orElse: () => RobotConnectionState.disconnected,
      ),
      errorCode: json['errorCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'battery': battery,
      'temperature': temperature,
      'speed': speed,
      'mode': mode,
      'timestamp': timestamp.toIso8601String(),
      'connectionState': connectionState.name,
      'errorCode': errorCode,
    };
  }
}
