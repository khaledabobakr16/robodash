import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/domain/entities/detection.dart';

import 'detection_painter.dart';

class VisionDetectionsOverlay extends StatelessWidget {
  final List<Detection> detections;
  final Size previewSize;

  const VisionDetectionsOverlay({
    super.key,
    required this.detections,
    required this.previewSize,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final responsive = Responsive.of(context);
    final visionBackground = isDark
        ? DarkColors.visionBackground
        : LightColors.visionBackground;
    final visionAccent = isDark
        ? DarkColors.visionAccent
        : LightColors.visionAccent;
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          painter: DetectionPainter(
            detections: detections,
            screenWidth: constraints.maxWidth,
            screenHeight: constraints.maxHeight,
            previewSize: previewSize,
            visionBackground: visionBackground,
            visionAccent: visionAccent,
            responsive: responsive,
          ),
        );
      },
    );
  }
}
