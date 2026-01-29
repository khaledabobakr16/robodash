import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/constants/app_strings/app_fonts.dart';

ThemeData lightTheme(Locale locale) {
  final isArabic = locale.languageCode == 'ar';

  return ThemeData(
    brightness: Brightness.light,

    // Scaffold
    scaffoldBackgroundColor: LightColors.scaffold,
    // Dialog Theme
    dialogTheme: DialogThemeData(
      backgroundColor: LightColors.cardBackground,
      titleTextStyle: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: LightColors.primaryText,
      ),
      contentTextStyle: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
        fontSize: 16,
        color: LightColors.primaryText,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: LightColors.appBar,
      foregroundColor: LightColors.splashText,
      elevation: 2,
      scrolledUnderElevation: 0.0,

      titleTextStyle: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,

        fontWeight: FontWeight.bold,
        color: LightColors.splashText,
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: LightColors.splashText),
    ),
    // BottomNavigationBar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: LightColors.scaffold,
      selectedItemColor: LightColors.homeAccent,
      unselectedItemColor: LightColors.homeSecondaryText,
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
      color: LightColors.homeCardBackground,
      elevation: 2,
      margin: const EdgeInsets.all(8),
    ),

    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(LightColors.cardBackground),
      ),
    ),

    // ColorScheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: LightColors.homeAccent,
      brightness: Brightness.light,
      primary: LightColors.appBar,
      secondary: LightColors.homeAccent,
    ),

    // TextTheme
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,

        fontWeight: FontWeight.bold,
        color: LightColors.homePrimaryText,
      ),
      displayMedium: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,

        fontWeight: FontWeight.bold,
        color: LightColors.homePrimaryText,
      ),
      bodyLarge: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,

        color: LightColors.homePrimaryText,
      ),
      bodyMedium: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,

        color: LightColors.homeSecondaryText,
      ),
      labelLarge: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
        fontWeight: FontWeight.bold,
        color: LightColors.splashText,
      ),
    ),

    // ElevatedButton Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightColors.controlButtonPrimary,
        foregroundColor: LightColors.splashText,
        textStyle: TextStyle(
          fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    // SnackBar Theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: LightColors.controlButtonSecondary,
      contentTextStyle: TextStyle(
        fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
        color: LightColors.splashText,
      ),
    ),
  );
}
