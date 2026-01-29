import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/dependency_injection/service_locator.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/presentation/features/voice/cubit/voice_cubit.dart';
import 'package:robodash/presentation/features/voice/cubit/voice_state.dart';
import 'package:robodash/presentation/features/voice/widgets/language_dropdown.dart';
import 'package:robodash/presentation/features/voice/widgets/mic_toggle_button.dart';
import 'package:robodash/presentation/features/voice/widgets/mic_visualizer.dart';
import 'package:robodash/presentation/features/voice/widgets/voice_text_display.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  String _selectedLanguage = 'en_US';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VoiceCubit>(
      create: (_) => getIt<VoiceCubit>(),
      child: BlocBuilder<VoiceCubit, VoiceState>(
        builder: (context, state) {
          final cubit = context.read<VoiceCubit>();
          final isListening = cubit.isListening;

          final isDark = Theme.of(context).brightness == Brightness.dark;
          final responsive = Responsive.of(context);

          final primaryColor = isDark
              ? DarkColors.voiceAccent
              : LightColors.voiceAccent;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LanguageDropdown(
                    selectedLanguage: _selectedLanguage,
                    isListening: isListening,
                    primaryColor: primaryColor,
                    onChanged: (value) =>
                        setState(() => _selectedLanguage = value),
                  ),
                  SizedBox(height: responsive.h(50)),
                  MicVisualizer(isListening: isListening),
                  SizedBox(height: responsive.h(40)),
                  VoiceTextDisplay(state: state, isListening: isListening),
                  SizedBox(height: responsive.h(60)),
                  MicToggleButton(
                    isListening: isListening,
                    cubit: cubit,
                    primaryColor: primaryColor,
                    localeId: _selectedLanguage,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
