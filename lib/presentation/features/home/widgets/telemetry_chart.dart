import 'package:flutter/material.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/battery_helper.dart';
import 'package:robodash/core/utils/responsive.dart';

class BatteryChart extends StatelessWidget {
  final int battery;

  const BatteryChart({super.key, required this.battery});

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;
    final responsive = Responsive.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appLocalization.batteryLevel,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: responsive.font(18),
          ),
        ),
        SizedBox(height: responsive.h(15)),
        LinearProgressIndicator(
          value: battery / 100,
          minHeight: responsive.h(20),
          backgroundColor: Colors.grey.shade300,
          color: BatteryHelper.getColor(context, battery),
        ),
        SizedBox(height: responsive.h(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '$battery%',
              style: TextStyle(
                fontSize: responsive.font(17),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
