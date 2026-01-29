import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/utils/responsive.dart';

class MoreCardItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const MoreCardItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final brightness = Theme.of(context).brightness;

    final iconColor = brightness == Brightness.dark
        ? DarkColors.morePrimaryIcon
        : LightColors.morePrimaryIcon;

    final textColor = brightness == Brightness.dark
        ? DarkColors.morePrimaryText
        : LightColors.morePrimaryText;

    return Card(
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: responsive.s(25)),
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: responsive.font(15),
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
