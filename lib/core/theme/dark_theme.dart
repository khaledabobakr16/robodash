import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_strings/app_fonts.dart';

ThemeData darkTheme(Locale locale) {
  final isArabic = locale.languageCode == 'ar';

  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkColors.scaffold,
    dialogTheme: DialogThemeData(
      backgroundColor: DarkColors.cardBackground,

      titleTextStyle: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: DarkColors.primaryText,
      ),
      contentTextStyle: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
        fontSize: 16,
        color: DarkColors.primaryText,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: DarkColors.appBar,
      foregroundColor: DarkColors.homePrimaryText,
      elevation: 0,
      scrolledUnderElevation: 0.0,

      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
        fontWeight: FontWeight.bold,
        color: DarkColors.homePrimaryText,
      ),
      iconTheme: IconThemeData(color: DarkColors.homePrimaryText),
    ),
    //bottomNavigationBarTheme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DarkColors.scaffold,
      selectedItemColor: DarkColors.homeAccent,
      unselectedItemColor: DarkColors.homeSecondaryText,
      selectedLabelStyle: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
      ),
      type: BottomNavigationBarType.fixed,
    ),
    // Card Theme
    cardTheme: CardThemeData(
      color: DarkColors.homeCardBackground,
      elevation: 2,
      margin: const EdgeInsets.all(8),
    ),

    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(DarkColors.cardBackground),
      ),
    ),

    // ColorScheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: DarkColors.homeAccent,
      brightness: Brightness.dark,
      primary: DarkColors.appBar,
      secondary: DarkColors.homeAccent,
    ),

    // TextTheme
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
        fontWeight: FontWeight.bold,
        color: DarkColors.homePrimaryText,
      ),
      displayMedium: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,

        fontWeight: FontWeight.bold,
        color: DarkColors.homePrimaryText,
      ),
      bodyLarge: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,

        color: DarkColors.homePrimaryText,
      ),
      bodyMedium: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,

        color: DarkColors.homePrimaryText,
      ),
      labelLarge: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
        fontWeight: FontWeight.bold,
        color: DarkColors.homePrimaryText,
      ),
    ),

    // ElevatedButton Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkColors.controlButtonPrimary,
        foregroundColor: DarkColors.controlTextPrimary,
        textStyle: TextStyle(
          fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    // SnackBar Theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: DarkColors.controlButtonSecondary,
      contentTextStyle: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
        color: DarkColors.controlTextPrimary,
      ),
    ),
  );
}
