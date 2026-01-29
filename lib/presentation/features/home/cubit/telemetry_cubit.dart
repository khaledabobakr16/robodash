import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robodash/domain/usecases/stream_telemetry.dart';

import 'telemetry_state.dart';

class TelemetryCubit extends Cubit<TelemetryState> {
  final StreamTelemetry _streamTelemetry;
  StreamSubscription? _subscription;

  final List<FlSpot> _batteryPoints = [];
  final List<FlSpot> _temperaturePoints = [];

  static const int maxSeconds = 60;

  TelemetryCubit(this._streamTelemetry) : super(const TelemetryLoading());

  void start() {
    _subscription?.cancel();

    _subscription = _streamTelemetry.call().listen((telemetry) {
      final now = DateTime.now().millisecondsSinceEpoch.toDouble();

      _batteryPoints.add(FlSpot(now, telemetry.battery.toDouble()));

      _temperaturePoints.add(FlSpot(now, telemetry.temperature.toDouble()));

      final cutoff = DateTime.now()
          .subtract(const Duration(seconds: maxSeconds))
          .millisecondsSinceEpoch
          .toDouble();

      _batteryPoints.removeWhere((p) => p.x < cutoff);
      _temperaturePoints.removeWhere((p) => p.x < cutoff);

      emit(
        TelemetryLoaded(
          telemetry: telemetry,
          batteryPoints: List.unmodifiable(_batteryPoints),
          temperaturePoints: List.unmodifiable(_temperaturePoints),
        ),
      );
    });
  }

  void retry() {
    _subscription?.cancel();
    _streamTelemetry.reset();
    start();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
