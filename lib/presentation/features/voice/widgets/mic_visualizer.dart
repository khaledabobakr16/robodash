import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/utils/responsive.dart';

class MicVisualizer extends StatelessWidget {
  final bool isListening;

  const MicVisualizer({super.key, required this.isListening});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final responsive = Responsive.of(context);

    final voiceListeningColor = isDark
        ? DarkColors.voiceListeningColor
        : LightColors.voiceListeningColor;
    final voiceGrayColor = isDark
        ? DarkColors.voiceGrayColor
        : LightColors.voiceGrayColor;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: responsive.h(100),
      width: responsive.w(100),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isListening
            ? voiceListeningColor.withValues(alpha: .1)
            : voiceGrayColor.shade100,
        border: isListening
            ? Border.all(
                color: voiceListeningColor.withValues(alpha: 0.5),
                width: responsive.w(3),
              )
            : null,
      ),
      child: Icon(
        isListening ? Icons.graphic_eq : Icons.mic_none,
        size: responsive.s(60),
        color: isListening ? voiceListeningColor : voiceGrayColor,
      ),
    );
  }
}
