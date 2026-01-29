import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:robodash/domain/entities/command.dart';
import 'package:robodash/domain/usecases/send_command.dart';
import 'package:robodash/presentation/features/control/cubit/command_cubit.dart';
import 'package:robodash/presentation/features/control/cubit/command_state.dart';

class MockSendCommand extends Mock implements SendCommand {}

void main() {
  late CommandCubit cubit;
  late MockSendCommand mockSendCommand;

  setUpAll(() {
    registerFallbackValue(
      Command(command: '', timestamp: DateTime.now(), success: false),
    );
  });

  setUp(() {
    mockSendCommand = MockSendCommand();
    cubit = CommandCubit(sendCommandUseCase: mockSendCommand);
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state is CommandInitial', () {
    expect(cubit.state, isA<CommandInitial>());
  });

  blocTest<CommandCubit, CommandState>(
    'sendCommand emits CommandSending then CommandLogUpdated on success',
    build: () {
      when(() => mockSendCommand(any())).thenAnswer((_) async => true);
      return cubit;
    },
    act: (cubit) => cubit.sendCommand('forward'),
    expect: () => [
      isA<CommandSending>(),
      isA<CommandLogUpdated>().having(
        (s) => s.lastCommand.success,
        'command succeeded',
        true,
      ),
    ],
  );

  blocTest<CommandCubit, CommandState>(
    'sendCommand emits CommandSending then CommandLogUpdated on failure',
    build: () {
      when(() => mockSendCommand(any())).thenAnswer((_) async => false);
      return cubit;
    },
    act: (cubit) => cubit.sendCommand('forward'),
    expect: () => [
      isA<CommandSending>(),
      isA<CommandLogUpdated>().having(
        (s) => s.lastCommand.success,
        'command failed',
        false,
      ),
    ],
  );

  blocTest<CommandCubit, CommandState>(
    'setSpeed emits CommandSpeedChanged',
    build: () => cubit,
    act: (cubit) => cubit.setSpeed(80),
    expect: () => [
      isA<CommandSpeedChanged>().having((s) => s.speed, 'speed', 80),
    ],
  );
}
