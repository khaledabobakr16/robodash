import '../entities/command.dart';

abstract class CommandRepository {
  Future<bool> sendCommand(Command command);
}
