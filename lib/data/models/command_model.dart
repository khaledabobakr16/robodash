import '../../domain/entities/command.dart';

class CommandModel extends Command {
  CommandModel({
    required super.command,
    required super.timestamp,
    required super.success,
    super.speed,
  });

  factory CommandModel.fromJson(Map<String, dynamic> json) {
    return CommandModel(
      command: json['command'],
      timestamp: DateTime.parse(json['timestamp']),
      success: json['success'] as bool,
      speed: json['speed'] != null ? json['speed'] as int : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'command': command,
      'timestamp': timestamp.toIso8601String(),
      'success': success,
      'speed': speed,
    };
  }
}
