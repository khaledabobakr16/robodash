import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/domain/entities/detection.dart';

import 'vision_event_feed_header.dart';
import 'vision_event_feed_list.dart';

class VisionEventFeed extends StatelessWidget {
  final List<Detection> detections;

  const VisionEventFeed({super.key, required this.detections});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final responsive = Responsive.of(context);
    final visionCardBackground = isDark
        ? DarkColors.visionCardBackground
        : LightColors.visionCardBackground;
    final visionAccent = isDark
        ? DarkColors.visionAccent
        : LightColors.visionAccent;
    return Positioned(
      bottom: 20,
      left: 10,
      right: 10,
      child: Container(
        height: responsive.h(120),
        decoration: BoxDecoration(
          color: visionCardBackground.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: visionAccent.withValues(alpha: 0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VisionEventFeedHeader(),
            Expanded(child: VisionEventFeedList(detections: detections)),
          ],
        ),
      ),
    );
  }
}
