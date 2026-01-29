import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/presentation/features/voice/cubit/voice_state.dart';

class VoiceTextDisplay extends StatelessWidget {
  final VoiceState state;
  final bool isListening;

  const VoiceTextDisplay({
    super.key,
    required this.state,
    required this.isListening,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final responsive = Responsive.of(context);

    final voiceTextDefault = isDark
        ? DarkColors.voiceTextDefault
        : LightColors.voiceTextDefault;
    final voiceTextListening = isDark
        ? DarkColors.voiceTextListening
        : LightColors.voiceTextListening;
    final voiceTextLoaded = isDark
        ? DarkColors.voiceTextLoaded
        : LightColors.voiceTextLoaded;
    final voiceTextError = isDark
        ? DarkColors.voiceTextError
        : LightColors.voiceTextError;
    final voiceBgIdle = isDark
        ? DarkColors.voiceBgIdle
        : LightColors.voiceBgIdle;
    String message;
    Color textColor = voiceTextDefault;
    FontWeight fontWeight = FontWeight.normal;

    if (state is VoiceLoaded) {
      message = (state as VoiceLoaded).recognizedText;

      textColor = isListening ? voiceTextListening : voiceTextLoaded;
      fontWeight = isListening ? FontWeight.bold : FontWeight.w500;
    } else if (state is VoiceError) {
      message = AppLocalizations.of(context)!.voiceCommandNotFound;
      textColor = voiceTextError;
    } else if (isListening) {
      message = AppLocalizations.of(context)!.voiceListening;
      textColor = voiceTextListening;
      fontWeight = FontWeight.bold;
    } else {
      message = AppLocalizations.of(context)!.voiceReady;
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        key: ValueKey(message),
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 100),
        decoration: BoxDecoration(
          color: isListening
              ? voiceTextListening.withValues(alpha: 0.05)
              : voiceBgIdle.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(15),
          border: isListening
              ? Border.all(color: voiceTextListening.withValues(alpha: 0.2))
              : null,
        ),
        child: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: responsive.font(18),
              color: textColor,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
