import 'package:flexi_charts/src/core/models/chart_style.dart';
import 'package:flutter/material.dart';
import 'models/bar_chart_data.dart';
import 'models/bar_chart_style.dart';
import 'painters/bar_chart_painter.dart';

class BarChart extends StatelessWidget {
  final BarChartData data;
  final BarChartStyle style;
  final ChartTheme theme;
  final CustomPainter? customPainter;

  const BarChart({
    super.key,
    required this.data,
    this.style = const BarChartStyle(),
    this.theme = const ChartTheme(),
    this.customPainter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding to ensure labels are not clipped
      padding: const EdgeInsets.fromLTRB(40, 20, 20, 30),
      child: CustomPaint(
        size: Size.infinite,
        painter: customPainter ??
            BarChartPainter(data: data, style: style, theme: theme),
      ),
    );
  }
}
