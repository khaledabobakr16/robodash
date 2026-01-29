enum RobotConnectionState { disconnected, connecting, connected, error }

class Telemetry {
  final int battery;
  final int temperature;
  final int speed;
  final String mode;
  final DateTime timestamp;
  final RobotConnectionState connectionState;
  final String? errorCode;

  Telemetry({
    required this.battery,
    required this.temperature,
    required this.speed,
    required this.mode,
    required this.timestamp,
    required this.connectionState,
    this.errorCode,
  });
}
