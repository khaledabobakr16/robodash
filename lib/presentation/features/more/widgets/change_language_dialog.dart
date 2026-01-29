// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:robodash/app/global_cubits/localization_cubit/locale_cubit.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/responsive.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final localeCubit = GetIt.instance<LocaleCubit>();
    final currentLocale = localeCubit.state.locale;
    final responsive = Responsive.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final caneclTextButton = isDark
        ? DarkColors.caneclTextButton
        : LightColors.caneclTextButton;
    final radioActiveDot = isDark
        ? DarkColors.radioActiveDot
        : LightColors.radioActiveDot;
    return AlertDialog(
      title: Text(
        AppLocalizations.of(context)!.moreChangeLanguage,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: responsive.font(17),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<Locale>(
            title: Text(
              'English',
              style: TextStyle(fontSize: responsive.font(17)),
            ),
            activeColor: radioActiveDot,
            value: const Locale('en'),
            groupValue: currentLocale,
            onChanged: (locale) {
              if (locale != null) {
                localeCubit.changeLocale(locale);
                Navigator.pop(context);
              }
            },
          ),
          RadioListTile<Locale>(
            title: Text(
              'العربية',
              style: TextStyle(fontSize: responsive.font(17)),
            ),
            value: const Locale('ar'),
            activeColor: radioActiveDot,
            groupValue: currentLocale,
            onChanged: (locale) {
              if (locale != null) {
                localeCubit.changeLocale(locale);
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
              color: caneclTextButton,
            ),
          ),
        ),
      ],
    );
  }
}
