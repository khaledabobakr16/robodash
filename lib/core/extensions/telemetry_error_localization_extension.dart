import 'package:flutter/material.dart';
import 'package:robodash/core/l10n/app_localizations.dart';

extension TelemetryErrorCodeLocalization on String? {
  String erroLocalized(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    switch (this) {
      case 'MOTOR_OVERLOAD':
        return l10n.motorOverload;
      case 'SENSOR_MALFUNCTION':
        return l10n.sensorMalfunction;
      case 'BATTERY_EMPTY':
        return l10n.batteryEmpty;
      default:
        return l10n.unknownError;
    }
  }
}
