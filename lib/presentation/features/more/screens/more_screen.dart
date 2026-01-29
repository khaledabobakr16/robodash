import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/dependency_injection/data_di.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/presentation/features/more/cubit/app_version_cubit.dart';
import 'package:robodash/presentation/features/more/widgets/change_language_dialog.dart';
import 'package:robodash/presentation/features/more/widgets/change_theme_dialog.dart';
import 'package:robodash/presentation/features/more/widgets/more_card_item.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final brightness = Theme.of(context).brightness;

    final textColor = brightness == Brightness.dark
        ? DarkColors.morePrimaryText
        : LightColors.morePrimaryText;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MoreCardItem(
              icon: Icons.language,
              title: AppLocalizations.of(context)!.moreChangeLanguage,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const ChangeLanguageDialog(),
                );
              },
            ),

            SizedBox(height: responsive.h(10)),
            MoreCardItem(
              icon: Icons.brightness_6,
              title: AppLocalizations.of(context)!.moreChangeTheme,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const ChangeThemeDialog(),
                );
              },
            ),
            SizedBox(height: responsive.h(10)),
            MoreCardItem(
              icon: Icons.privacy_tip,
              title: AppLocalizations.of(context)!.morePrivacyPolicy,
              onTap: () {},
            ),
            SizedBox(height: responsive.h(10)),
            MoreCardItem(
              icon: Icons.description,
              title: AppLocalizations.of(context)!.moreTermsConditions,
              onTap: () {},
            ),
            SizedBox(height: responsive.h(10)),
            MoreCardItem(
              icon: Icons.contact_mail,
              title: AppLocalizations.of(context)!.moreContactUs,
              onTap: () {},
            ),
            SizedBox(height: responsive.h(60)),

            BlocBuilder<AppVersionCubit, AppVersionState>(
              bloc: getIt<AppVersionCubit>()..loadVersion(),
              builder: (context, state) {
                String versionText = AppLocalizations.of(
                  context,
                )!.versionUnknown;

                if (state is AppVersionLoaded) {
                  versionText = AppLocalizations.of(
                    context,
                  )!.version(state.version);
                } else if (state is AppVersionError) {
                  versionText = AppLocalizations.of(context)!.versionError;
                }

                return Text(
                  versionText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: responsive.font(16),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
