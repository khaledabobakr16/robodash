import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:robodash/domain/entities/command.dart';
import 'package:robodash/domain/usecases/send_command.dart';

import 'command_state.dart';

class CommandCubit extends Cubit<CommandState> {
  final SendCommand sendCommandUseCase;

  final List<Command> _commands = [];
  int _speed = 50;

  CommandCubit({required this.sendCommandUseCase}) : super(CommandInitial());

  int get speed => _speed;
  List<Command> get commands => List.unmodifiable(_commands.reversed);

  void setSpeed(int value) {
    _speed = value;
    emit(CommandSpeedChanged(_speed));
  }

  Future<void> sendCommand(String commandKey) async {
    final cmd = Command(
      command: commandKey,
      timestamp: DateTime.now(),
      success: false,
    );

    emit(CommandSending(cmd));

    try {
      final success = await sendCommandUseCase(
        cmd,
      ).timeout(const Duration(seconds: 3), onTimeout: () => false);

      final completed = Command(
        command: cmd.command,
        timestamp: cmd.timestamp,
        success: success,
        speed: _speed,
      );

      _commands.add(completed);
      emit(
        CommandLogUpdated(
          commands: List.from(_commands.reversed),
          lastCommand: completed,
        ),
      );
    } catch (_) {
      final failed = Command(
        command: cmd.command,
        timestamp: cmd.timestamp,
        success: false,
        speed: _speed,
      );
      _commands.add(failed);

      emit(
        CommandLogUpdated(
          commands: List.from(_commands.reversed),
          lastCommand: failed,
        ),
      );
    }
  }

  String formatTimestamp(DateTime dt) {
    return DateFormat('HH:mm:ss – dd/MM/yyyy').format(dt);
  }
}
