// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'روبوداش';

  @override
  String get connected => 'متصل';

  @override
  String get connecting => 'جاري الاتصال...';

  @override
  String get disconnected => 'غير متصل';

  @override
  String get error => 'خطأ';

  @override
  String get battery => 'البطارية';

  @override
  String get temperature => 'درجة الحرارة';

  @override
  String get speed => 'السرعة';

  @override
  String get mode => 'الوضع';

  @override
  String get connection => 'الاتصال';

  @override
  String get modeIdle => 'في وضع الاستعداد';

  @override
  String get modeChat => 'التفاعل الصوتي';

  @override
  String get modeNavigation => 'التنقل الذاتي';

  @override
  String get modeFaceRecognition => 'التعرف على الوجوه';

  @override
  String get batteryLevel => 'مستوى البطارية';

  @override
  String get batteryLast60Sec => 'مستوى البطارية خلال آخر 60 ثانية';

  @override
  String get noTelemetryData => 'لا توجد بيانات متاحة';

  @override
  String get unknownError => 'خطأ غير معروف';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get bottomNavHome => 'الرئيسية';

  @override
  String get bottomNavControl => 'التحكم';

  @override
  String get bottomNavVoice => 'صوت';

  @override
  String get bottomNavVision => 'رؤية';

  @override
  String get bottomNavMore => 'المزيد';

  @override
  String get dashboard => 'لوحة التحكم';

  @override
  String get control => 'مركز التحكم';

  @override
  String get voice => 'الأوامر الصوتية';

  @override
  String get vision => 'كشف الكائنات';

  @override
  String get more => 'المزيد';

  @override
  String get moreChangeLanguage => 'تغيير اللغة';

  @override
  String get moreChangeTheme => 'تغيير المظهر';

  @override
  String get morePrivacyPolicy => 'سياسة الخصوصية';

  @override
  String get moreTermsConditions => 'الشروط والأحكام';

  @override
  String get moreContactUs => 'تواصل معنا';

  @override
  String get cancel => 'الغاء';

  @override
  String get lightTheme => 'فاتح';

  @override
  String get darkTheme => 'داكن';

  @override
  String get versionUnknown => 'الإصدار غير معروف';

  @override
  String version(Object version) {
    return 'الإصدار $version';
  }

  @override
  String get versionError => 'فشل تحميل الإصدار';

  @override
  String get forward => 'إلى الأمام';

  @override
  String get back => 'إلى الخلف';

  @override
  String get left => 'إلى اليسار';

  @override
  String get right => 'إلى اليمين';

  @override
  String get stop => 'توقف';

  @override
  String get commandSuccess => 'تم إرسال الأمر بنجاح';

  @override
  String get commandFail => 'فشل إرسال الأمر';

  @override
  String get commandLog => 'سجل الأوامر';

  @override
  String get noCommandsSentYet => 'لم ترسل أي أوامر بعد';

  @override
  String get motorOverload => 'حمل زائد على المحرك';

  @override
  String get sensorMalfunction => 'عطل في أحد المستشعرات';

  @override
  String get batteryEmpty => 'بطارية الروبوت فارغة، يرجى الشحن ثم إعادة المحاولة';

  @override
  String get voiceListening => 'جارٍ الاستماع...';

  @override
  String get voiceReady => 'جاهز لسماعك';

  @override
  String get voiceCommandNotFound => 'أمر غير موجود';

  @override
  String get sentDetected => 'تم الإرسال: تم الكشف عن';

  @override
  String get streamStatusConnected => 'حالة البث: متصل';

  @override
  String get robotLiveFeed => 'البث الحي للروبوت';
}
