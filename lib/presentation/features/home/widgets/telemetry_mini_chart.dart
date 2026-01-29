import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/responsive.dart';

class BatteryMiniChart extends StatelessWidget {
  final List<FlSpot> points;
  final int lastSeconds;

  const BatteryMiniChart({
    super.key,
    required this.points,
    this.lastSeconds = 60,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final batteryColor = isDark
        ? DarkColors.batteryLine
        : LightColors.batteryLine;
    final batteryAreaColor = isDark
        ? DarkColors.batteryArea
        : LightColors.batteryArea;
    final gridLineColor = isDark
        ? DarkColors.chartGridLine
        : LightColors.chartGridLine;
    final borderColor = isDark
        ? DarkColors.chartBorder
        : LightColors.chartBorder;
    final chartTextColor = isDark
        ? DarkColors.chartText
        : LightColors.chartText;
    final tooltipTextColor = isDark
        ? DarkColors.chartTooltipText
        : LightColors.chartTooltipText;

    final responsive = Responsive.of(context);
    final appLocalization = AppLocalizations.of(context)!;

    if (points.isEmpty) return const SizedBox(height: 180);

    final now = DateTime.now().millisecondsSinceEpoch.toDouble();
    final cutoff = now - lastSeconds * 1000;

    final recentPoints = points
        .where((p) => p.x >= cutoff)
        .map(
          (p) => FlSpot(
            ((p.x - cutoff) / 1000).toDouble(),
            p.y.clamp(0, 100).toDouble(),
          ),
        )
        .toList();

    if (recentPoints.isEmpty) return const SizedBox(height: 180);

    final minX = 0.0;
    final maxX = lastSeconds.toDouble();

    final minY = recentPoints
        .map((p) => p.y)
        .reduce((a, b) => a < b ? a : b)
        .clamp(0, 100)
        .toDouble();

    final maxY = recentPoints
        .map((p) => p.y)
        .reduce((a, b) => a > b ? a : b)
        .clamp(0, 100)
        .toDouble();

    final safeMaxY = maxY > 100 ? 100.0 : maxY;

    final yInterval = ((safeMaxY - minY) / 5)
        .clamp(1, double.infinity)
        .toDouble();
    final xInterval = ((maxX - minX) / 6).clamp(1, double.infinity).toDouble();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appLocalization.batteryLast60Sec,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: responsive.font(18),
          ),
        ),
        SizedBox(height: responsive.h(20)),
        SizedBox(
          height: responsive.h(200),
          child: LineChart(
            LineChartData(
              minX: minX,
              maxX: maxX,
              minY: minY,
              maxY: safeMaxY,
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                getDrawingHorizontalLine: (value) =>
                    FlLine(color: gridLineColor, strokeWidth: 1),
              ),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 60,
                    interval: yInterval,
                    getTitlesWidget: (value, _) {
                      return Directionality(
                        textDirection: TextDirection.ltr,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: responsive.h(10),
                          ),
                          child: Text(
                            '${value.clamp(0, 100).toInt()} %',
                            style: TextStyle(
                              fontSize: responsive.font(12),
                              color: chartTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: xInterval,
                    getTitlesWidget: (value, _) {
                      return Transform.rotate(
                        angle: -0.4,
                        child: Text(
                          '${value.toInt()}s',
                          style: TextStyle(
                            fontSize: responsive.font(12),
                            color: chartTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: borderColor),
              ),
              lineTouchData: LineTouchData(
                handleBuiltInTouches: true,
                touchTooltipData: LineTouchTooltipData(
                  tooltipPadding: const EdgeInsets.all(6),
                  getTooltipItems: (spots) {
                    return spots.map((spot) {
                      return LineTooltipItem(
                        '${spot.y.clamp(0, 100).toStringAsFixed(1)} %\n${spot.x.toInt()}s',
                        TextStyle(
                          color: tooltipTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: responsive.font(15),
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: recentPoints,
                  isCurved: true,
                  barWidth: 3,
                  color: batteryColor,
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: batteryAreaColor.withValues(alpha: 0.2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
