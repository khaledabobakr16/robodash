import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Robo Dash'**
  String get appName;

  /// No description provided for @connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// No description provided for @connecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get connecting;

  /// No description provided for @disconnected.
  ///
  /// In en, this message translates to:
  /// **'Disconnected'**
  String get disconnected;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @battery.
  ///
  /// In en, this message translates to:
  /// **'Battery'**
  String get battery;

  /// No description provided for @temperature.
  ///
  /// In en, this message translates to:
  /// **'Temperature'**
  String get temperature;

  /// No description provided for @speed.
  ///
  /// In en, this message translates to:
  /// **'Speed'**
  String get speed;

  /// No description provided for @mode.
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get mode;

  /// No description provided for @connection.
  ///
  /// In en, this message translates to:
  /// **'Connection'**
  String get connection;

  /// No description provided for @modeIdle.
  ///
  /// In en, this message translates to:
  /// **'Standby'**
  String get modeIdle;

  /// No description provided for @modeChat.
  ///
  /// In en, this message translates to:
  /// **'Voice Interaction'**
  String get modeChat;

  /// No description provided for @modeNavigation.
  ///
  /// In en, this message translates to:
  /// **'Autonomous Navigation'**
  String get modeNavigation;

  /// No description provided for @modeFaceRecognition.
  ///
  /// In en, this message translates to:
  /// **'Face Recognition'**
  String get modeFaceRecognition;

  /// No description provided for @batteryLevel.
  ///
  /// In en, this message translates to:
  /// **'Battery Level'**
  String get batteryLevel;

  /// No description provided for @batteryLast60Sec.
  ///
  /// In en, this message translates to:
  /// **'Battery over last 60 sec'**
  String get batteryLast60Sec;

  /// No description provided for @noTelemetryData.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noTelemetryData;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @bottomNavHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get bottomNavHome;

  /// No description provided for @bottomNavControl.
  ///
  /// In en, this message translates to:
  /// **'Control'**
  String get bottomNavControl;

  /// No description provided for @bottomNavVoice.
  ///
  /// In en, this message translates to:
  /// **'Voice'**
  String get bottomNavVoice;

  /// No description provided for @bottomNavVision.
  ///
  /// In en, this message translates to:
  /// **'Vision'**
  String get bottomNavVision;

  /// No description provided for @bottomNavMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get bottomNavMore;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @control.
  ///
  /// In en, this message translates to:
  /// **'Control Center'**
  String get control;

  /// No description provided for @voice.
  ///
  /// In en, this message translates to:
  /// **'Voice Commands'**
  String get voice;

  /// No description provided for @vision.
  ///
  /// In en, this message translates to:
  /// **'Object Detection'**
  String get vision;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @moreChangeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get moreChangeLanguage;

  /// No description provided for @moreChangeTheme.
  ///
  /// In en, this message translates to:
  /// **'Change Theme'**
  String get moreChangeTheme;

  /// No description provided for @morePrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get morePrivacyPolicy;

  /// No description provided for @moreTermsConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get moreTermsConditions;

  /// No description provided for @moreContactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get moreContactUs;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @versionUnknown.
  ///
  /// In en, this message translates to:
  /// **'Version unknown'**
  String get versionUnknown;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String version(Object version);

  /// No description provided for @versionError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load version'**
  String get versionError;

  /// No description provided for @forward.
  ///
  /// In en, this message translates to:
  /// **'Forward'**
  String get forward;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @left.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get left;

  /// No description provided for @right.
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get right;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @commandSuccess.
  ///
  /// In en, this message translates to:
  /// **'Command sent successfully'**
  String get commandSuccess;

  /// No description provided for @commandFail.
  ///
  /// In en, this message translates to:
  /// **'Failed to send command'**
  String get commandFail;

  /// No description provided for @commandLog.
  ///
  /// In en, this message translates to:
  /// **'Command Log'**
  String get commandLog;

  /// No description provided for @noCommandsSentYet.
  ///
  /// In en, this message translates to:
  /// **'No commands sent yet'**
  String get noCommandsSentYet;

  /// No description provided for @motorOverload.
  ///
  /// In en, this message translates to:
  /// **'Motor overload detected'**
  String get motorOverload;

  /// No description provided for @sensorMalfunction.
  ///
  /// In en, this message translates to:
  /// **'Sensor malfunction'**
  String get sensorMalfunction;

  /// No description provided for @batteryEmpty.
  ///
  /// In en, this message translates to:
  /// **'Robot battery is empty. Please charge and retry'**
  String get batteryEmpty;

  /// No description provided for @voiceListening.
  ///
  /// In en, this message translates to:
  /// **'Listening...'**
  String get voiceListening;

  /// No description provided for @voiceReady.
  ///
  /// In en, this message translates to:
  /// **'Ready to hear you'**
  String get voiceReady;

  /// No description provided for @voiceCommandNotFound.
  ///
  /// In en, this message translates to:
  /// **'Command not found'**
  String get voiceCommandNotFound;

  /// No description provided for @sentDetected.
  ///
  /// In en, this message translates to:
  /// **'SENT: Detected'**
  String get sentDetected;

  /// No description provided for @streamStatusConnected.
  ///
  /// In en, this message translates to:
  /// **'Stream Status: Connected'**
  String get streamStatusConnected;

  /// No description provided for @robotLiveFeed.
  ///
  /// In en, this message translates to:
  /// **'ROBOT LIVE FEED'**
  String get robotLiveFeed;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
