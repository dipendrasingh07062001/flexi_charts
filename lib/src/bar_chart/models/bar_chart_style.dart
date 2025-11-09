import 'package:flutter/material.dart';

class BarChartStyle {
  final double barWidth;
  final Radius barRadius;
  final double barPadding;
  final List<Color> gradientColors;

  const BarChartStyle({
    this.barWidth = 20.0,
    this.barRadius = const Radius.circular(4.0),
    this.barPadding = 8.0,
    this.gradientColors = const [Colors.blue, Colors.lightBlueAccent],
  });
}
