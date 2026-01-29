import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/responsive.dart';

class VisionEventFeedHeader extends StatelessWidget {
  const VisionEventFeedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final responsive = Responsive.of(context);
    final visionAccent = isDark
        ? DarkColors.visionAccent
        : LightColors.visionAccent;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        AppLocalizations.of(context)!.robotLiveFeed,
        style: TextStyle(
          color: visionAccent,
          fontSize: responsive.font(15),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
