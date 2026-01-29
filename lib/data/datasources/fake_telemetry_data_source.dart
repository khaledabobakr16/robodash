import 'dart:async';
import 'dart:math';

import '../../domain/entities/telemetry.dart';
import '../models/telemetry_model.dart';
import 'telemetry_data_source.dart';

class FakeTelemetryDataSource implements TelemetryDataSource {
  final _random = Random();
  int _battery = 100;
  bool _paused = false;

  final List<String> _modes = ['Idle', 'Navigation', 'FaceRec', 'Chat'];
  final List<String> _errorCode = ['MOTOR_OVERLOAD', 'SENSOR_MALFUNCTION'];

  StreamController<TelemetryModel>? _controller;
  TelemetryModel? _lastTelemetry;

  int _errorCount = 0;

  final int _firstErrorAt = 70;
  final int _secondErrorAt = 25;

  FakeTelemetryDataSource() {
    _controller = StreamController<TelemetryModel>.broadcast(
      onListen: _startStreaming,
    );
  }

  void _startStreaming() {
    _paused = false;

    Future.microtask(() async {
      while (!_paused && _controller!.hasListener) {
        final now = DateTime.now();
        final mode = _modes[_random.nextInt(_modes.length)];

        // Speeddd Based on Mode
        int speed = switch (mode) {
          'Idle' || 'Chat' => 0,
          'Navigation' => _random.nextInt(51),
          'FaceRec' => _random.nextInt(11),
          _ => 0,
        };

        // Battery drain
        if (speed > 0 && now.second % 15 == 0) {
          _battery = (_battery - 1).clamp(0, 100);
        }

        //  Battery empty
        if (_battery <= 0) {
          final telemetry = TelemetryModel(
            battery: 0,
            temperature: 20 + _random.nextInt(10),
            speed: 0,
            mode: 'Idle',
            timestamp: DateTime.now(),
            connectionState: RobotConnectionState.error,
            errorCode: 'BATTERY_EMPTY',
          );

          _paused = true;
          _lastTelemetry = telemetry;
          if (!_controller!.isClosed) _controller!.add(telemetry);
          break;
        }

        // Error based on battery progress
        if (_battery <= _firstErrorAt && _errorCount == 0) {
          _errorCount++;
          _triggerImmediateError();
          break;
        }

        if (_battery <= _secondErrorAt && _errorCount == 1) {
          _errorCount++;
          _triggerImmediateError();
          break;
        }

        final telemetry = TelemetryModel(
          battery: _battery,
          temperature: 20 + _random.nextInt(10),
          speed: speed,
          mode: mode,
          timestamp: now,
          connectionState: RobotConnectionState.connected,
          errorCode: null,
        );

        _lastTelemetry = telemetry;
        if (!_controller!.isClosed) _controller!.add(telemetry);

        await Future.delayed(const Duration(milliseconds: 200));
      }
    });
  }

  void _triggerImmediateError() {
    final telemetry = TelemetryModel(
      battery: _battery,
      temperature: 20 + _random.nextInt(10),
      speed: 0,
      mode: 'Idle',
      timestamp: DateTime.now(),
      connectionState: RobotConnectionState.error,
      errorCode: _errorCode[_random.nextInt(_errorCode.length)],
    );

    _paused = true;
    _lastTelemetry = telemetry;
    if (!_controller!.isClosed) {
      _controller!.add(telemetry);
    }
  }

  @override
  Stream<TelemetryModel> streamTelemetry() => _controller!.stream;

  void retry() {
    if (_paused) {
      _paused = false;
      if (_lastTelemetry != null && !_controller!.isClosed) {
        _controller!.add(_lastTelemetry!);
      }
      _startStreaming();
    }
  }

  void dispose() {
    _paused = true;
    _controller?.close();
  }
}
