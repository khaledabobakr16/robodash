import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/utils/responsive.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryText = isDark
        ? DarkColors.homePrimaryText
        : LightColors.homePrimaryText;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsive.h(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: responsive.font(17),
              fontWeight: FontWeight.bold,
              color: primaryText,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: responsive.font(15),
              color: valueColor ?? primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
