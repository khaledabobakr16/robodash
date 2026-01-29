import 'package:flutter/material.dart';
import 'package:robodash/core/l10n/app_localizations.dart';

extension TelemetryModeX on String {
  String localized(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;

    switch (this) {
      case 'Idle':
        return appLocalization.modeIdle;
      case 'Chat':
        return appLocalization.modeChat;
      case 'Navigation':
        return appLocalization.modeNavigation;
      case 'FaceRec':
        return appLocalization.modeFaceRecognition;
      default:
        return this;
    }
  }
}
