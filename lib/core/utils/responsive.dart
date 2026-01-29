import 'package:flutter/material.dart';

class Responsive {
  final double width;
  final double height;
  final double shortestSide;

  factory Responsive.of(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Responsive._internal(size.width, size.height);
  }

  Responsive._internal(this.width, this.height)
    : shortestSide = width < height ? width : height;

  // Responsive font size
  double font(double baseSize) {
    if (width >= 1200) return baseSize * 1.2;
    if (width >= 600) return baseSize;
    return baseSize * 0.8;
  }

  // Responsive  width
  double w(double baseWidth) {
    if (width >= 1200) return baseWidth * 1.2;
    if (width >= 600) return baseWidth;
    return baseWidth * 0.8;
  }

  // Responsive  height
  double h(double baseHeight) {
    if (height >= 1200) return baseHeight * 1.2;
    if (height >= 600) return baseHeight;
    return baseHeight * 0.8;
  }

  //  circular & rounded widgets
  double r(double baseSize) {
    return baseSize * (shortestSide / 400);
  }

  // Responsive icons
  double s(double baseSize) {
    if (shortestSide >= 1200) return baseSize * 1.3;
    if (shortestSide >= 600) return baseSize * 1.0;
    return baseSize * 0.85;
  }
}
