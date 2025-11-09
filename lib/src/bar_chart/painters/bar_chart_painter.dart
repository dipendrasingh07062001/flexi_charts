import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/models/chart_style.dart';
import '../../core/painters/base_chart_painter.dart';
import '../models/bar_chart_data.dart';
import '../models/bar_chart_style.dart';

class BarChartPainter extends BaseChartPainter {
  final BarChartData data;
  final BarChartStyle style;

  BarChartPainter({
    required this.data,
    this.style = const BarChartStyle(),
    required ChartTheme theme,
  }) : super(theme: theme);

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size); // Draws background and grid
    _drawAxes(canvas, size);
    _drawBars(canvas, size);
    _drawYLabels(canvas, size);
  }

  void _drawAxes(Canvas canvas, Size size) {
    final axisPaint = Paint()
      ..color = theme.yAxisStyle.color
      ..strokeWidth = theme.yAxisStyle.thickness;

    // Draw Y-axis line (X-axis line is implicitly the bottom of the chart)
    canvas.drawLine(Offset(0, 0), Offset(0, size.height), axisPaint);
  }

  void _drawYLabels(Canvas canvas, Size size) {
    final double maxValue = data.dataPoints.map((p) => p.y).reduce(max);
    // Draw 5 labels including 0 and max value
    for (var i = 0; i <= 4; i++) {
      final yValue = maxValue * (4 - i) / 4;
      final yPos = size.height * i / 4;
      _drawText(
        canvas,
        yValue.toStringAsFixed(0), // Format label as integer
        Offset(-theme.yAxisStyle.labelSpacing, yPos),
        theme.yAxisStyle.labelStyle,
        isYAxis: true,
      );
    }
  }

  void _drawBars(Canvas canvas, Size size) {
    if (data.dataPoints.isEmpty) return;

    final double maxValue = data.dataPoints.map((p) => p.y).reduce(max);
    final double barCount = data.dataPoints.length.toDouble();
    final double totalPadding = (barCount + 1) * style.barPadding;
    final double availableWidth = size.width - totalPadding;
    final double barWidth = availableWidth / barCount;

    for (int i = 0; i < data.dataPoints.length; i++) {
      final point = data.dataPoints[i];
      final x = style.barPadding + i * (barWidth + style.barPadding);
      final barHeight = (point.y / maxValue) * size.height;
      final y = size.height - barHeight;

      final barRect = RRect.fromRectAndCorners(
        Rect.fromLTWH(x, y, barWidth, barHeight),
        topLeft: style.barRadius,
        topRight: style.barRadius,
      );

      final paint = Paint()
        ..shader = LinearGradient(
          colors: style.gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(barRect.outerRect);

      canvas.drawRRect(barRect, paint);

      // Draw X-axis labels
      _drawText(
          canvas,
          point.x,
          Offset(x + barWidth / 2, size.height + theme.xAxisStyle.labelSpacing),
          theme.xAxisStyle.labelStyle);
    }
  }

  void _drawText(Canvas canvas, String text, Offset offset, TextStyle style,
      {bool isYAxis = false}) {
    final textSpan = TextSpan(text: text, style: style);
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: isYAxis ? TextAlign.right : TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: isYAxis ? 40 : double.infinity);

    final dx = isYAxis
        ? offset.dx - textPainter.width
        : offset.dx - textPainter.width / 2;
    final dy = offset.dy - textPainter.height / 2;

    textPainter.paint(canvas, Offset(dx, dy));
  }
}
