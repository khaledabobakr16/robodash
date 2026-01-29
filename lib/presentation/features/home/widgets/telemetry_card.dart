import 'package:flutter/material.dart';
import 'package:robodash/core/extensions/robot_connection_state_extension.dart';
import 'package:robodash/core/extensions/telemetry_mode_extension.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/domain/entities/telemetry.dart';
import 'package:robodash/presentation/features/home/widgets/info_row.dart';

class TelemetryCard extends StatelessWidget {
  final Telemetry telemetry;

  const TelemetryCard({super.key, required this.telemetry});

  @override
  Widget build(BuildContext context) {
    final connection = telemetry.connectionState.localized(context);

    final r = Responsive.of(context);
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(r.r(15)),
        child: Column(
          children: [
            InfoRow(
              label: AppLocalizations.of(context)?.battery ?? 'Battery',
              value: '${telemetry.battery}%',
            ),
            InfoRow(
              label: AppLocalizations.of(context)?.temperature ?? 'Temperature',
              value: '${telemetry.temperature}°C',
            ),
            InfoRow(
              label: AppLocalizations.of(context)?.speed ?? 'Speed',
              value: '${telemetry.speed}',
            ),
            InfoRow(
              label: AppLocalizations.of(context)?.mode ?? 'Mode',
              value: telemetry.mode.localized(context),
            ),
            InfoRow(
              label: AppLocalizations.of(context)?.connection ?? 'Connection',
              value: connection['text'],
              valueColor: connection['color'],
            ),
          ],
        ),
      ),
    );
  }
}
