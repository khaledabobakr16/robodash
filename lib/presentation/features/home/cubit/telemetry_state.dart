import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:robodash/domain/entities/telemetry.dart';

@immutable
sealed class TelemetryState {
  const TelemetryState();
}

final class TelemetryLoading extends TelemetryState {
  const TelemetryLoading();
}

final class TelemetryLoaded extends TelemetryState {
  final Telemetry telemetry;
  final List<FlSpot> batteryPoints;
  final List<FlSpot> temperaturePoints;

  const TelemetryLoaded({
    required this.telemetry,
    required this.batteryPoints,
    required this.temperaturePoints,
  });
}

final class TelemetryError extends TelemetryState {
  final String message;
  const TelemetryError(this.message);
}
