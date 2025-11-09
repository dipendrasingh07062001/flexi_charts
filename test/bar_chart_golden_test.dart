import 'package:flexi_charts/flexi_charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Common data for tests
  const testData = BarChartData(
    dataPoints: [
      ChartDataPoint(x: 'A', y: 80),
      ChartDataPoint(x: 'B', y: 40),
      ChartDataPoint(x: 'C', y: 60),
    ],
  );

  // Helper function to wrap the chart in a testable widget
  Widget buildChart(Widget chart) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 400,
            height: 300,
            color: Colors.white, // Ensure a consistent background
            child: chart,
          ),
        ),
      ),
    );
  }

  group('BarChart Golden Tests', () {
    testWidgets('renders correctly with default styles',
        (WidgetTester tester) async {
      const chart = BarChart(data: testData);

      await tester.pumpWidget(buildChart(chart));

      await expectLater(
        find.byType(BarChart),
        matchesGoldenFile('goldens/bar_chart_default.png'),
      );
    });

    testWidgets('renders correctly with custom styles and themes',
        (WidgetTester tester) async {
      final chart = BarChart(
        data: testData,
        style: const BarChartStyle(
          barRadius: Radius.circular(10),
          gradientColors: [Colors.orange, Colors.red],
          barPadding: 20.0,
        ),
        theme: ChartTheme(
          backgroundColor: Colors.black,
          gridLineColor: Colors.grey.shade800,
          xAxisStyle: const AxisStyle(
            labelStyle: TextStyle(color: Colors.white, fontSize: 14),
          ),
          yAxisStyle: const AxisStyle(
            color: Colors.white,
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
      );

      await tester.pumpWidget(buildChart(chart));

      await expectLater(
        find.byType(BarChart),
        matchesGoldenFile('goldens/bar_chart_custom.png'),
      );
    });

    testWidgets('renders correctly with empty data',
        (WidgetTester tester) async {
      const chart = BarChart(data: BarChartData(dataPoints: []));

      await tester.pumpWidget(buildChart(chart));

      await expectLater(
        find.byType(BarChart),
        matchesGoldenFile('goldens/bar_chart_empty.png'),
      );
    });
  });
}
