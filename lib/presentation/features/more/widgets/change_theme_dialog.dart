// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:robodash/app/global_cubits/theme_cubit/theme_cubit.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/responsive.dart';

class ChangeThemeDialog extends StatelessWidget {
  const ChangeThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = GetIt.instance<ThemeCubit>();
    final responsive = Responsive.of(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cancelTextColor = isDarkMode
        ? DarkColors.caneclTextButton
        : LightColors.caneclTextButton;
    final radioActiveDot = isDarkMode
        ? DarkColors.radioActiveDot
        : LightColors.radioActiveDot;

    return AlertDialog(
      title: Text(
        AppLocalizations.of(context)!.moreChangeTheme,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: responsive.font(17),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<ThemeState>(
            title: Text(
              AppLocalizations.of(context)!.lightTheme,
              style: TextStyle(fontSize: responsive.font(17)),
            ),
            value: const LightThemeState(),
            groupValue: themeCubit.state,
            activeColor: radioActiveDot,
            onChanged: (mode) {
              if (mode is LightThemeState) {
                themeCubit.toggleTheme();
                Navigator.pop(context);
              }
            },
          ),
          RadioListTile<ThemeState>(
            title: Text(
              AppLocalizations.of(context)!.darkTheme,
              style: TextStyle(fontSize: responsive.font(17)),
            ),
            value: const DarkThemeState(),
            groupValue: themeCubit.state,
            activeColor: radioActiveDot,
            onChanged: (mode) {
              if (mode is DarkThemeState) {
                themeCubit.toggleTheme();
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            AppLocalizations.of(context)!.cancel,
            style: TextStyle(
              fontSize: responsive.font(17),
              color: cancelTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
