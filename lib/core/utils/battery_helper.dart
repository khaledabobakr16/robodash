import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';

class BatteryHelper {
  static Color getColor(BuildContext context, int battery) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (battery > 50) {
      return isDark ? DarkColors.batteryHigh : LightColors.batteryHigh;
    } else if (battery > 20) {
      return isDark ? DarkColors.batteryMedium : LightColors.batteryMedium;
    } else {
      return isDark ? DarkColors.batteryLow : LightColors.batteryLow;
    }
  }
}
