import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:robodash/app/global_cubits/theme_cubit/theme_cubit.dart';
import 'package:robodash/core/dependency_injection/service_locator.dart';

import '../core/l10n/app_localizations.dart';
import '../core/theme/dark_theme.dart';
import '../core/theme/light_theme.dart';
import 'global_cubits/localization_cubit/locale_cubit.dart';
import 'global_cubits/localization_cubit/locale_state.dart';
import 'router.dart';

class RoboDashApp extends StatelessWidget {
  const RoboDashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<LocaleCubit>()),
        BlocProvider.value(value: getIt<ThemeCubit>()),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, localeState) {
          final locale = localeState.locale;

          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              final themeMode = themeState is DarkThemeState
                  ? ThemeMode.dark
                  : ThemeMode.light;

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: AppLocalizations.of(context)?.appName ?? 'Robo Dash',

                // Theme
                theme: lightTheme(locale),
                darkTheme: darkTheme(locale),
                themeMode: themeMode,

                locale: locale,

                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

                // Navigation
                initialRoute: '/',
                onGenerateRoute: AppRouter.generateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
