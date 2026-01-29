import 'package:robodash/domain/entities/command.dart';

abstract class CommandState {}

class CommandInitial extends CommandState {}

class CommandSpeedChanged extends CommandState {
  final int speed;
  CommandSpeedChanged(this.speed);
}

class CommandSending extends CommandState {
  final Command command;
  CommandSending(this.command);
}

class CommandLogUpdated extends CommandState {
  final List<Command> commands;

  final Command lastCommand;

  CommandLogUpdated({required this.commands, required this.lastCommand});
}
