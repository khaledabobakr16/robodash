// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Robo Dash';

  @override
  String get connected => 'Connected';

  @override
  String get connecting => 'Connecting...';

  @override
  String get disconnected => 'Disconnected';

  @override
  String get error => 'Error';

  @override
  String get battery => 'Battery';

  @override
  String get temperature => 'Temperature';

  @override
  String get speed => 'Speed';

  @override
  String get mode => 'Mode';

  @override
  String get connection => 'Connection';

  @override
  String get modeIdle => 'Standby';

  @override
  String get modeChat => 'Voice Interaction';

  @override
  String get modeNavigation => 'Autonomous Navigation';

  @override
  String get modeFaceRecognition => 'Face Recognition';

  @override
  String get batteryLevel => 'Battery Level';

  @override
  String get batteryLast60Sec => 'Battery over last 60 sec';

  @override
  String get noTelemetryData => 'No data available';

  @override
  String get unknownError => 'Unknown error';

  @override
  String get retry => 'Retry';

  @override
  String get bottomNavHome => 'Home';

  @override
  String get bottomNavControl => 'Control';

  @override
  String get bottomNavVoice => 'Voice';

  @override
  String get bottomNavVision => 'Vision';

  @override
  String get bottomNavMore => 'More';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get control => 'Control Center';

  @override
  String get voice => 'Voice Commands';

  @override
  String get vision => 'Object Detection';

  @override
  String get more => 'More';

  @override
  String get moreChangeLanguage => 'Change Language';

  @override
  String get moreChangeTheme => 'Change Theme';

  @override
  String get morePrivacyPolicy => 'Privacy Policy';

  @override
  String get moreTermsConditions => 'Terms & Conditions';

  @override
  String get moreContactUs => 'Contact Us';

  @override
  String get cancel => 'Cancel';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get versionUnknown => 'Version unknown';

  @override
  String version(Object version) {
    return 'Version $version';
  }

  @override
  String get versionError => 'Failed to load version';

  @override
  String get forward => 'Forward';

  @override
  String get back => 'Back';

  @override
  String get left => 'Left';

  @override
  String get right => 'Right';

  @override
  String get stop => 'Stop';

  @override
  String get commandSuccess => 'Command sent successfully';

  @override
  String get commandFail => 'Failed to send command';

  @override
  String get commandLog => 'Command Log';

  @override
  String get noCommandsSentYet => 'No commands sent yet';

  @override
  String get motorOverload => 'Motor overload detected';

  @override
  String get sensorMalfunction => 'Sensor malfunction';

  @override
  String get batteryEmpty => 'Robot battery is empty. Please charge and retry';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get voiceReady => 'Ready to hear you';

  @override
  String get voiceCommandNotFound => 'Command not found';

  @override
  String get sentDetected => 'SENT: Detected';

  @override
  String get streamStatusConnected => 'Stream Status: Connected';

  @override
  String get robotLiveFeed => 'ROBOT LIVE FEED';
}
