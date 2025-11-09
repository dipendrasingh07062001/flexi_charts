import 'package:flutter/material.dart';
import '../models/chart_style.dart';

// Abstract painter class to enforce a structure for all chart painters
abstract class BaseChartPainter extends CustomPainter {
  final ChartTheme theme;

  BaseChartPainter({required this.theme});

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas, size);
    _drawGrid(canvas, size);
    // Derived classes will implement axis and chart drawing
  }

  void _drawBackground(Canvas canvas, Size size) {
    final paint = Paint()..color = theme.backgroundColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  void _drawGrid(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = theme.gridLineColor
      ..strokeWidth = theme.gridLineThickness;

    // Draw 4 horizontal grid lines
    for (var i = 1; i <= 4; i++) {
      final y = size.height * i / 5;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // For simplicity, always repaint. Can be optimized later.
    return true;
  }
}
