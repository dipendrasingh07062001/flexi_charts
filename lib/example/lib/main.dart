import 'package:flexi_charts/flexi_charts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexi Charts Example',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
      ),
      home: const ChartScreen(),
    );
  }
}

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexi Bar Chart'),
      ),
      body: Center(
        child: Container(
          height: 350,
          padding: const EdgeInsets.all(16.0),
          child: BarChart(
            data: const BarChartData(
              dataPoints: [
                ChartDataPoint(x: 'Jan', y: 85),
                ChartDataPoint(x: 'Feb', y: 60),
                ChartDataPoint(x: 'Mar', y: 95),
                ChartDataPoint(x: 'Apr', y: 70),
                ChartDataPoint(x: 'May', y: 80),
                ChartDataPoint(x: 'Jun', y: 90),
              ],
            ),
            style: const BarChartStyle(
              barRadius: Radius.circular(8),
              gradientColors: [Colors.deepPurple, Colors.purpleAccent],
              barPadding: 12.0,
            ),
            theme: ChartTheme(
              backgroundColor: Colors.white,
              gridLineColor: Colors.grey.shade300,
              xAxisStyle: const AxisStyle(
                labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              yAxisStyle: const AxisStyle(
                labelStyle: TextStyle(color: Colors.black54, fontSize: 12),
                labelSpacing: 10,
              ),
            ),
            // Example of injecting a custom painter (optional)
            // customPainter: MyCustomBarPainter(...),
          ),
        ),
      ),
    );
  }
}
