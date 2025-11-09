class ChartDataPoint {
  final String x;
  final double y;

  const ChartDataPoint({required this.x, required this.y});
}

// Base class for chart data
abstract class ChartData {
  final List<ChartDataPoint> dataPoints;
  final List<String>? xLabels;
  final List<String>? yLabels;

  const ChartData({
    required this.dataPoints,
    this.xLabels,
    this.yLabels,
  });
}
