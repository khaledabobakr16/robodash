class Command {
  final String command;
  final DateTime timestamp;
  final bool success;
  final int? speed;

  Command({
    required this.command,
    required this.timestamp,
    required this.success,
    this.speed,
  });
}
