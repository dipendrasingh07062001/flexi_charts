
# flexi_charts

A flexible and modular charting library for Flutter, built from the ground up with `CustomPainter` for maximum customization and performance.

## Features

- **Built with CustomPainter:** All rendering is done on the canvas, ensuring high performance and a completely custom look.
- **Highly Customizable:** Tweak everything from axis styles, grid lines, and background colors to individual bar designs, including width, radius, and gradient colors.
- **Modular Architecture:** The package is designed to be easily expandable. While it starts with a Bar Chart, the core is ready for Line, Pie, and other chart types.
- **Clean and Typed API:** Data and styling are separated into clear, easy-to-use configuration objects like `BarChartData`, `ChartTheme`, and `BarChartStyle`.
- **Painter Injection:** For ultimate control, you can inject your own `CustomPainter` class to override or extend the chart's visual behavior.

## Getting Started

### 1. Installation

Add `flexi_charts` to your project's `pubspec.yaml` file:

```yaml
dependencies:
  flexi_charts: ^0.0.1 # Replace with the latest version
```

### 2. Install the package

Run the following command in your terminal:

```sh
flutter pub get
```

### 3. Import the package

Now, in your Dart code, you can use:

```dart
import 'package:flexi_charts/flexi_charts.dart';
```

## Basic Usage

To display a simple bar chart, you only need to provide a `BarChartData` object with a list of `ChartDataPoint`s.

```dart
import 'package:flutter/material.dart';
import 'package:flexi_charts/flexi_charts.dart';

class MyChartWidget extends StatelessWidget {
  const MyChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16.0),
      child: BarChart(
        data: BarChartData(
          dataPoints: const [
            ChartDataPoint(x: 'Jan', y: 85),
            ChartDataPoint(x: 'Feb', y: 60),
            ChartDataPoint(x: 'Mar', y: 95),
          ],
        ),
      ),
    );
  }
}
```

## Full Customization

This is where `flexi_charts` shines. You can customize almost every visual aspect by providing `BarChartStyle` and `ChartTheme` objects.

```dart
BarChart(
  // Your data
  data: BarChartData(
    dataPoints: const [
      ChartDataPoint(x: 'Jan', y: 85),
      ChartDataPoint(x: 'Feb', y: 60),
      ChartDataPoint(x: 'Mar', y: 95),
      ChartDataPoint(x: 'Apr', y: 70),
      ChartDataPoint(x: 'May', y: 80),
      ChartDataPoint(x: 'Jun', y: 90),
    ],
  ),

  // Customize the look of the bars
  style: const BarChartStyle(
    barRadius: Radius.circular(8),
    gradientColors: [Colors.deepPurple, Colors.purpleAccent],
    barPadding: 12.0,
  ),

  // Customize the overall look of the chart area
  theme: ChartTheme(
    backgroundColor: Colors.white,
    gridLineColor: Colors.grey.shade300,
    gridLineThickness: 1.0,
    xAxisStyle: const AxisStyle(
      labelStyle: TextStyle(
        color: Colors.black54,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      labelSpacing: 12,
    ),
    yAxisStyle: const AxisStyle(
      labelStyle: TextStyle(color: Colors.black54, fontSize: 12),
      labelSpacing: 10,
    ),
  ),
)
```

## Roadmap

This is the planned future for `flexi_charts`:

- [x] **Bar Chart**
- [ ] **Line Chart**
- [ ] **Pie Chart**
- [ ] **Scatter Plot**
- [ ] **Animations and User Interaction (Tooltips, Selection)**

## Contributing

Contributions are welcome! If you find a bug, have a feature request, or want to contribute to the code, please feel free to:

1.  Open an issue on GitHub.
2.  Fork the repository and submit a pull request.
