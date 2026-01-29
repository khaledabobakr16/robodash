import 'package:flutter/material.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/presentation/features/control/widgets/command_button.dart';

class DirectionalControlButton extends StatelessWidget {
  final String label;
  final String action;
  final Color color;
  final double size;
  final Responsive responsive;
  final Function(String) onPressed;

  const DirectionalControlButton({
    super.key,
    required this.label,
    required this.action,
    required this.color,
    required this.size,
    required this.responsive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CommandButton(
        label: label,
        backGroundcolor: color,
        onPressed: () => onPressed(action),
        responsive: responsive,
      ),
    );
  }
}
