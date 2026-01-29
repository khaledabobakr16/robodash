import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/dependency_injection/service_locator.dart';
import 'package:robodash/core/extensions/telemetry_error_localization_extension.dart';
import 'package:robodash/core/extensions/telemetry_mode_extension.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/domain/entities/telemetry.dart';
import 'package:robodash/presentation/features/home/cubit/telemetry_cubit.dart';
import 'package:robodash/presentation/features/home/cubit/telemetry_state.dart';
import 'package:robodash/presentation/features/home/widgets/connection_status.dart';
import 'package:robodash/presentation/features/home/widgets/home_shimmer.dart';
import 'package:robodash/presentation/features/home/widgets/info_box.dart';
import 'package:robodash/presentation/features/home/widgets/telemetry_card.dart';
import 'package:robodash/presentation/features/home/widgets/telemetry_chart.dart';
import 'package:robodash/presentation/features/home/widgets/telemetry_mini_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?
  _snackBarController;
  @override
  void dispose() {
    _snackBarController?.close();
    _snackBarController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final responsive = Responsive.of(context);
    final snackBarText = isDark
        ? DarkColors.snackBarText
        : LightColors.snackBarText;
    final snackBarAction = isDark
        ? DarkColors.snackBarAction
        : LightColors.snackBarAction;
    final snackBarBackground = isDark
        ? DarkColors.snackBarBackground
        : LightColors.snackBarBackground;
    final emptyDataText = isDark
        ? DarkColors.emptyDataText
        : LightColors.emptyDataText;

    return BlocProvider(
      create: (_) => getIt<TelemetryCubit>()..start(),
      child: Scaffold(
        body: BlocConsumer<TelemetryCubit, TelemetryState>(
          listener: (context, state) {
            if (state is TelemetryLoaded) {
              final isError =
                  state.telemetry.connectionState ==
                      RobotConnectionState.error ||
                  state.telemetry.connectionState ==
                      RobotConnectionState.disconnected;

              if (isError) {
                _snackBarController ??= ScaffoldMessenger.of(context)
                    .showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        content: Text(
                          state.telemetry.errorCode!.erroLocalized(context),
                          style: TextStyle(
                            color: snackBarText,
                            fontSize: responsive.font(16),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        duration: const Duration(days: 1),
                        action: SnackBarAction(
                          label: AppLocalizations.of(context)!.retry,
                          textColor: snackBarAction,
                          onPressed: () {
                            context.read<TelemetryCubit>().retry();
                          },
                        ),
                        backgroundColor: snackBarBackground,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    );
              } else {
                _snackBarController?.close();
                _snackBarController = null;
              }
            }
          },
          builder: (context, state) {
            if (state is TelemetryLoading) {
              return HomeShimmer(isDark: isDark);
            }

            Telemetry? telemetry;
            if (state is TelemetryLoaded) telemetry = state.telemetry;

            if (telemetry == null) {
              return Center(
                child: Text(
                  AppLocalizations.of(context)!.noTelemetryData,
                  style: TextStyle(color: emptyDataText),
                ),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ConnectionStatusWidget(
                      connectionState: telemetry.connectionState,
                    ),
                  ),
                  TelemetryCard(telemetry: telemetry),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InfoBox(
                          label: AppLocalizations.of(context)!.speed,
                          value: '${telemetry.speed}',
                        ),
                      ),
                      Expanded(
                        child: InfoBox(
                          label: AppLocalizations.of(context)!.mode,
                          value: telemetry.mode.localized(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: responsive.h(15)),
                  BatteryChart(battery: telemetry.battery),
                  SizedBox(height: responsive.h(15)),
                  if (state is TelemetryLoaded)
                    BatteryMiniChart(points: state.batteryPoints),
                  SizedBox(height: responsive.h(15)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
