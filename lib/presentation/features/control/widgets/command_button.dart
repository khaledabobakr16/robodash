import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/utils/responsive.dart';

class CommandButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backGroundcolor;
  final Responsive responsive;

  const CommandButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.backGroundcolor,
    required this.responsive,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final commandButtonTextColor = brightness == Brightness.dark
        ? DarkColors.commandButtonTextColor
        : LightColors.commandButtonTextColor;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundcolor,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(5),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: responsive.w(100),
        height: responsive.h(30),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: commandButtonTextColor,
              fontWeight: FontWeight.bold,
              fontSize: responsive.font(13),
            ),
          ),
        ),
      ),
    );
  }
}
