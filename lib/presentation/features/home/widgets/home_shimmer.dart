import 'package:flutter/material.dart';
import 'package:robodash/core/constants/app_colors/dark_colors.dart';
import 'package:robodash/core/constants/app_colors/light_colors.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  final bool isDark;

  const HomeShimmer({super.key, this.isDark = false});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    final baseColor = isDark ? DarkColors.shimmerBase : LightColors.shimmerBase;
    final highlightColor = isDark
        ? DarkColors.shimmerHighlight
        : LightColors.shimmerHighlight;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(responsive.w(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: responsive.h(24),
              width: responsive.w(150),
              color: baseColor,
              margin: EdgeInsets.only(bottom: responsive.h(16)),
            ),

            Container(
              height: responsive.h(120),
              color: baseColor,
              margin: EdgeInsets.only(bottom: responsive.h(16)),
            ),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: responsive.h(60),
                    color: baseColor,
                    margin: EdgeInsets.only(right: responsive.w(8)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: responsive.h(60),
                    color: baseColor,
                    margin: EdgeInsets.only(left: responsive.w(8)),
                  ),
                ),
              ],
            ),
            SizedBox(height: responsive.h(15)),

            Container(
              height: responsive.h(150),
              color: baseColor,
              margin: EdgeInsets.only(bottom: responsive.h(16)),
            ),

            Container(height: responsive.h(60), color: baseColor),
            SizedBox(height: responsive.h(15)),
          ],
        ),
      ),
    );
  }
}
