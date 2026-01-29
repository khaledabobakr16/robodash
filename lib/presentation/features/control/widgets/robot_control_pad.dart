import 'package:flutter/material.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/presentation/features/control/cubit/command_cubit.dart';
import 'package:robodash/presentation/features/control/widgets/command_button.dart';
import 'package:robodash/presentation/features/control/widgets/directional_control_button.dart';

class RobotControlPad extends StatelessWidget {
  final CommandCubit commandCubit;
  final Responsive responsive;
  final Color primaryColor;
  final Color stopColor;

  const RobotControlPad({
    super.key,
    required this.commandCubit,
    required this.responsive,
    required this.primaryColor,
    required this.stopColor,
  });

  @override
  Widget build(BuildContext context) {
    final double totalSize = responsive.w(260);
    final double btnSize = responsive.w(75);
    final double centerPos = (totalSize / 2) - (btnSize / 2);

    return SizedBox(
      height: totalSize,
      width: totalSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: totalSize * 0.8,
            height: totalSize * 0.8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor.withValues(alpha: 0.05),
              border: Border.all(
                color: primaryColor.withValues(alpha: 0.1),
                width: 2,
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: centerPos,
            child: DirectionalControlButton(
              label: AppLocalizations.of(context)!.forward,
              action: 'forward',
              color: primaryColor,
              size: btnSize,
              responsive: responsive,
              onPressed: commandCubit.sendCommand,
            ),
          ),

          Positioned(
            bottom: 0,
            left: centerPos,
            child: DirectionalControlButton(
              label: AppLocalizations.of(context)!.back,
              action: 'back',
              color: primaryColor,
              size: btnSize,
              responsive: responsive,
              onPressed: commandCubit.sendCommand,
            ),
          ),
          Positioned(
            top: centerPos,
            left: 0,
            child: DirectionalControlButton(
              label: AppLocalizations.of(context)!.left,
              action: 'left',
              color: primaryColor,
              size: btnSize,
              responsive: responsive,
              onPressed: commandCubit.sendCommand,
            ),
          ),
          Positioned(
            top: centerPos,
            right: 0,
            child: DirectionalControlButton(
              label: AppLocalizations.of(context)!.right,
              action: 'right',
              color: primaryColor,
              size: btnSize,
              responsive: responsive,
              onPressed: commandCubit.sendCommand,
            ),
          ),

          SizedBox(
            width: btnSize * 1.1,
            height: btnSize * 1.1,
            child: CommandButton(
              label: AppLocalizations.of(context)!.stop,
              backGroundcolor: stopColor,
              onPressed: () => commandCubit.sendCommand('stop'),
              responsive: responsive,
            ),
          ),
        ],
      ),
    );
  }
}
