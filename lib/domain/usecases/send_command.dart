import '../repositories/command_repository.dart';
import '../entities/command.dart';

class SendCommand {
  final CommandRepository repository;

  SendCommand(this.repository);

  Future<bool> call(Command command) async {
    return await repository.sendCommand(command);
  }
}
