import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/presentation/features/voice/cubit/voice_cubit.dart';

class MicToggleButton extends StatelessWidget {
  final bool isListening;
  final VoiceCubit cubit;
  final Color primaryColor;
  final String localeId;

  const MicToggleButton({
    super.key,
    required this.isListening,
    required this.cubit,
    required this.primaryColor,
    required this.localeId,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final responsive = Responsive.of(context);

    final voiceListeningColor = isDark
        ? DarkColors.voiceListeningColor
        : LightColors.voiceListeningColor;
    return InkWell(
      onTap: () => cubit.toggleListening(localeId: localeId),
      borderRadius: BorderRadius.circular(60),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isListening ? voiceListeningColor : primaryColor,
          boxShadow: [
            BoxShadow(
              color: (isListening ? voiceListeningColor : primaryColor)
                  .withValues(alpha: 0.4),
              blurRadius: isListening ? 30 : 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(
          isListening ? Icons.stop : Icons.mic,
          size: responsive.s(40),
          color: Colors.white,
        ),
      ),
    );
  }
}
