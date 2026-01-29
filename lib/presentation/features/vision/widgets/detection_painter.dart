import 'package:flutter/material.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/domain/entities/detection.dart';

class DetectionPainter extends CustomPainter {
  final List<Detection> detections;
  final double screenWidth;
  final double screenHeight;
  final Size previewSize;
  final Color visionBackground;
  final Color visionAccent;
  final Responsive responsive;

  DetectionPainter({
    required this.detections,
    required this.screenWidth,
    required this.screenHeight,
    required this.previewSize,
    required this.visionBackground,
    required this.visionAccent,
    required this.responsive,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = visionAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    final double scaleX = screenWidth / previewSize.height;
    final double scaleY = screenHeight / previewSize.width;

    for (var d in detections) {
      if (d.boundingBox != null) {
        final rect = Rect.fromLTRB(
          d.boundingBox!.left * scaleX,
          d.boundingBox!.top * scaleY,
          d.boundingBox!.right * scaleX,
          d.boundingBox!.bottom * scaleY,
        );

        canvas.drawRect(rect, paint);

        textPainter.text = TextSpan(
          text: '${d.label} ${(d.confidence * 100).toStringAsFixed(0)}%',
          style: TextStyle(
            color: visionBackground,
            backgroundColor: Colors.greenAccent,
            fontSize: responsive.font(15),
            fontWeight: FontWeight.bold,
          ),
        );

        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(rect.left, rect.top > 20 ? rect.top - 20 : rect.top),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
