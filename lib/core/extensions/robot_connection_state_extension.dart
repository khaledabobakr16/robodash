import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/domain/entities/telemetry.dart';

extension RobotConnectionStateX on RobotConnectionState {
  Map<String, dynamic> localized(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    switch (this) {
      case RobotConnectionState.connected:
        return {
          'text': appLocalization.connected,
          'color': isDark ? DarkColors.homeAccent : LightColors.homeAccent,
        };
      case RobotConnectionState.connecting:
        return {
          'text': appLocalization.connecting,
          'color': isDark
              ? DarkColors.connectionConnecting
              : LightColors.connectionConnecting,
        };
      case RobotConnectionState.disconnected:
        return {
          'text': appLocalization.disconnected,
          'color': isDark
              ? DarkColors.connectionDisconnected
              : LightColors.connectionDisconnected,
        };
      case RobotConnectionState.error:
        return {
          'text': appLocalization.error,
          'color': isDark
              ? DarkColors.connectionError
              : LightColors.connectionError,
        };
    }
  }
}
