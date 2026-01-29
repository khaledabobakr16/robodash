import 'package:robodash/data/models/command_model.dart';

import '../../domain/entities/command.dart';
import '../../domain/repositories/command_repository.dart';
import '../datasources/command_data_source.dart';

class CommandRepositoryImpl implements CommandRepository {
  final CommandDataSource dataSource;

  CommandRepositoryImpl(this.dataSource);

  @override
  Future<bool> sendCommand(Command command) async {
    return await dataSource.sendCommand(
      CommandModel(
        command: command.command,
        timestamp: command.timestamp,
        success: command.success,
        speed: command.speed,
      ),
    );
  }
}
