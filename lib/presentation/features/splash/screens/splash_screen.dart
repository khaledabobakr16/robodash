import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/constants/app_strings/app_fonts.dart';
import 'package:robodash/core/constants/app_strings/app_images.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/presentation/features/splash/cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final responsive = Responsive.of(context);

    return BlocProvider(
      create: (_) => SplashCubit()..startSplash(),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashCompleted) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, '/navBar');
              }
            });
          }
        },
        builder: (context, state) {
          final brightness = Theme.of(context).brightness;
          final splashBackground = brightness == Brightness.dark
              ? DarkColors.splashBackground
              : LightColors.splashBackground;
          final splashText = brightness == Brightness.dark
              ? DarkColors.splashText
              : LightColors.splashText;

          return Scaffold(
            backgroundColor: splashBackground,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    AppImages.pyramakerzLogo,
                    width: responsive.w(150),
                    height: responsive.h(150),
                  ),
                  SizedBox(height: responsive.h(20)),
                  // App name
                  Text(
                    AppLocalizations.of(context)?.appName ?? 'Robo Dash',
                    style: TextStyle(
                      fontFamily: isArabic ? AppFonts.arabic : AppFonts.english,
                      fontSize: responsive.font(28),
                      fontWeight: FontWeight.bold,
                      color: splashText,
                    ),
                  ),
                  SizedBox(height: responsive.h(20)),
                  // Linear progress indicator
                  if (state is SplashLoading)
                    SizedBox(
                      width: responsive.w(150),
                      child: LinearProgressIndicator(
                        value: state.progress / 100,
                        backgroundColor: splashText.withValues(alpha: 0.3),
                        color: splashText,
                      ),
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
