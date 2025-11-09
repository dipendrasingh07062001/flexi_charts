import 'package:flexi_charts/flexi_charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlexiCharts Models', () {
    // Test for ChartDataPoint
    test('ChartDataPoint holds correct values', () {
      const dataPoint = ChartDataPoint(x: 'Test', y: 100.0);
      expect(dataPoint.x, 'Test');
      expect(dataPoint.y, 100.0);
    });

    // Test for BarChartData
    test('BarChartData holds a list of data points', () {
      const data = BarChartData(
        dataPoints: [
          ChartDataPoint(x: 'A', y: 10),
          ChartDataPoint(x: 'B', y: 20),
        ],
      );
      expect(data.dataPoints.length, 2);
      expect(data.dataPoints[0].x, 'A');
    });

    // Test for ChartTheme and its defaults
    test('ChartTheme uses default values when none are provided', () {
      const theme = ChartTheme();
      expect(theme.backgroundColor, Colors.white);
      expect(theme.gridLineColor, Colors.grey);
      expect(theme.xAxisStyle.color, Colors.black);
    });

    // Test for BarChartStyle and its defaults
    test('BarChartStyle uses default values when none are provided', () {
      const style = BarChartStyle();
      expect(style.barWidth, 20.0);
      expect(style.gradientColors, const [Colors.blue, Colors.lightBlueAccent]);
    });

    // Test customization
    test('AxisStyle can be customized', () {
      const customStyle = AxisStyle(
        color: Colors.red,
        thickness: 3.0,
        labelStyle: TextStyle(fontSize: 16),
      );
      expect(customStyle.color, Colors.red);
      expect(customStyle.thickness, 3.0);
      expect(customStyle.labelStyle.fontSize, 16);
    });
  });
}
