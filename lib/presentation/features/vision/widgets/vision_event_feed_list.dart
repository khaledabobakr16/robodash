import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/domain/entities/detection.dart';

class VisionEventFeedList extends StatelessWidget {
  final List<Detection> detections;

  const VisionEventFeedList({super.key, required this.detections});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final responsive = Responsive.of(context);
    final visionTextPrimary = isDark
        ? DarkColors.visionTextPrimary
        : LightColors.visionTextPrimary;
    final visionAccent = isDark
        ? DarkColors.visionAccent
        : LightColors.visionAccent;
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      reverse: true,
      children: [
        ...detections.map(
          (d) => Text(
            "${AppLocalizations.of(context)!.sentDetected} ${d.label} (${(d.confidence * 100).toStringAsFixed(0)}%)",
            style: TextStyle(
              color: visionAccent,
              fontSize: responsive.font(15),
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.streamStatusConnected,
          style: TextStyle(
            color: visionTextPrimary,
            fontSize: responsive.font(12),
          ),
        ),
      ],
    );
  }
}
