import '../models/command_model.dart';

abstract class CommandDataSource {
  Future<bool> sendCommand(CommandModel command);
}
