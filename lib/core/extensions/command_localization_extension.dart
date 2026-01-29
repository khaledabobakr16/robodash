import 'package:robodash/core/l10n/app_localizations.dart';

extension CommandLocalization on AppLocalizations {
  String commandName(String command) {
    switch (command) {
      case 'forward':
        return forward;
      case 'back':
        return back;
      case 'left':
        return left;
      case 'right':
        return right;
      case 'stop':
        return stop;
      default:
        return command;
    }
  }
}
