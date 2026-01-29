import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/extensions/command_localization_extension.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/presentation/features/control/cubit/command_cubit.dart';
import 'package:robodash/presentation/features/control/cubit/command_state.dart';
import 'package:robodash/presentation/features/control/widgets/robot_control_pad.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final commandCubit = GetIt.instance<CommandCubit>();
    final brightness = Theme.of(context).brightness;
    final primaryColor = brightness == Brightness.dark
        ? DarkColors.controlButtonPrimary
        : LightColors.controlButtonPrimary;
    final textColor = brightness == Brightness.dark
        ? DarkColors.primaryText
        : LightColors.primaryText;
    final stopColor = brightness == Brightness.dark
        ? DarkColors.controlStopButton
        : LightColors.controlStopButton;
    final errorSnackBarColor = brightness == Brightness.dark
        ? DarkColors.errorControl
        : LightColors.errorControl;
    final sucessSnackBarColor = brightness == Brightness.dark
        ? DarkColors.sucessControl
        : LightColors.sucessControl;
    final errorColor = brightness == Brightness.dark
        ? DarkColors.errorControl
        : LightColors.errorControl;
    final sucessColor = brightness == Brightness.dark
        ? DarkColors.sucessControl
        : LightColors.sucessControl;

    return Padding(
      padding: EdgeInsets.all(responsive.w(16)),
      child: Column(
        children: [
          BlocBuilder<CommandCubit, CommandState>(
            bloc: commandCubit,
            builder: (context, state) {
              return Column(
                children: [
                  Text(
                    '${AppLocalizations.of(context)!.speed}: ${commandCubit.speed}',
                    style: TextStyle(
                      fontSize: responsive.font(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                    activeColor: primaryColor,
                    value: commandCubit.speed.toDouble(),
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: commandCubit.speed.toString(),
                    onChanged: (val) => commandCubit.setSpeed(val.toInt()),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: responsive.h(20)),

          RobotControlPad(
            commandCubit: commandCubit,
            responsive: responsive,
            primaryColor: primaryColor,
            stopColor: stopColor,
          ),

          SizedBox(height: responsive.h(30)),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.commandLog,
                style: TextStyle(
                  fontSize: responsive.font(18),
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
          SizedBox(height: responsive.h(15)),

          Expanded(
            child: BlocConsumer<CommandCubit, CommandState>(
              bloc: commandCubit,
              listener: (context, state) {
                if (state is CommandLogUpdated) {
                  final last = state.lastCommand;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        last.success
                            ? AppLocalizations.of(context)!.commandSuccess
                            : AppLocalizations.of(context)!.commandFail,
                      ),
                      backgroundColor: last.success
                          ? sucessSnackBarColor
                          : errorSnackBarColor,
                      duration: const Duration(seconds: 1),
                    ),
                  );
                }
              },
              builder: (context, state) {
                final commands = commandCubit.commands;
                if (commands.isEmpty) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context)!.noCommandsSentYet,
                      style: TextStyle(
                        fontSize: responsive.font(16),
                        color: textColor,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: commands.length,
                  itemBuilder: (context, index) {
                    final cmd = commands[index];
                    final localization = AppLocalizations.of(context)!;

                    return Card(
                      margin: EdgeInsets.symmetric(vertical: responsive.h(4)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(responsive.w(8)),
                      ),
                      child: ListTile(
                        leading: Icon(
                          cmd.success ? Icons.check_circle : Icons.error,
                          color: cmd.success ? sucessColor : errorColor,
                          size: responsive.w(28),
                        ),
                        title: Text(
                          '${localization.commandName(cmd.command)} (${AppLocalizations.of(context)!.speed}: ${cmd.speed})',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.font(16),
                            color: textColor,
                          ),
                        ),
                        subtitle: Text(
                          '${commandCubit.formatTimestamp(cmd.timestamp)} - ${cmd.success ? localization.commandSuccess : localization.commandFail}',
                          style: TextStyle(
                            fontSize: responsive.font(14),
                            color: textColor,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
