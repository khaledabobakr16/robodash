import 'dart:async';
import 'dart:math';

import '../models/command_model.dart';
import 'command_data_source.dart';

class FakeCommandDataSource implements CommandDataSource {
  final Random _random = Random();

  @override
  Future<bool> sendCommand(CommandModel command) async {
    // Rrandom delay between 200 ms to 1500 ms
    final delay = Duration(milliseconds: 200 + _random.nextInt(1300));

    try {
      final result = await Future.any([
        Future.delayed(delay, () => true),
        Future.delayed(
          const Duration(seconds: 1),
          () => throw TimeoutException('Timeout'),
        ),
      ]);

      // Random failure: 20%
      final success = result && _random.nextInt(5) != 0;
      return success;
    } catch (e) {
      // Timeout
      return false;
    }
  }
}
