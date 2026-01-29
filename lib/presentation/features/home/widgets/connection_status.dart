import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/extensions/robot_connection_state_extension.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/domain/entities/telemetry.dart';

class ConnectionStatusWidget extends StatelessWidget {
  final RobotConnectionState connectionState;

  const ConnectionStatusWidget({super.key, required this.connectionState});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final connectionUi = connectionState.localized(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryText = isDark
        ? DarkColors.homePrimaryText
        : LightColors.homePrimaryText;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: responsive.r(5),
          backgroundColor: connectionUi['color'],
        ),
        SizedBox(width: responsive.w(10)),
        Text(
          connectionUi['text'],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: responsive.font(15),
            color: primaryText,
          ),
        ),
      ],
    );
  }
}
