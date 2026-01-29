import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/utils/responsive.dart';

class InfoBox extends StatelessWidget {
  final String label;
  final String value;

  const InfoBox({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final primaryText = isDark
        ? DarkColors.homePrimaryText
        : LightColors.homePrimaryText;

    final tertiaryText = isDark
        ? DarkColors.homeTertiaryText
        : LightColors.homeTertiaryText;

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: tertiaryText,
                fontSize: responsive.font(16),
              ),
            ),
            SizedBox(height: responsive.h(10)),
            Text(
              value,
              style: TextStyle(
                color: primaryText,
                fontSize: responsive.font(16),
              ),
            ),
            SizedBox(height: responsive.h(10)),
          ],
        ),
      ),
    );
  }
}
