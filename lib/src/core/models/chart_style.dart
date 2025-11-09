import 'package:flutter/material.dart';

// Styling for axes
class AxisStyle {
  final Color color;
  final double thickness;
  final TextStyle labelStyle;
  final double labelSpacing;

  const AxisStyle({
    this.color = Colors.black,
    this.thickness = 1.0,
    this.labelStyle = const TextStyle(color: Colors.black, fontSize: 12),
    this.labelSpacing = 8.0,
  });
}

// Overall theme for the chart
class ChartTheme {
  final Color backgroundColor;
  final Color gridLineColor;
  final double gridLineThickness;
  final AxisStyle xAxisStyle;
  final AxisStyle yAxisStyle;

  const ChartTheme({
    this.backgroundColor = Colors.white,
    this.gridLineColor = Colors.grey,
    this.gridLineThickness = 0.5,
    this.xAxisStyle = const AxisStyle(),
    this.yAxisStyle = const AxisStyle(),
  });
}
