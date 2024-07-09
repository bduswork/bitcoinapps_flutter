import 'package:btcapp/models/chart_model/line_chart_data_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomLineChart extends StatefulWidget {
  final List<LineChartDataModel> cdata;
  final Color lineColor;
  final double lineWidth;
  const CustomLineChart({super.key, required this.cdata, required this.lineColor, required this.lineWidth});

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  @override
  Widget build(BuildContext context) {
    double maxX = widget.cdata.last.time; // Find the maximum x-value
    double maxY = widget.cdata.map((data) => data.value).reduce((a, b) => a > b ? a : b)+0.5; // Find the maximum y-value
    return SfCartesianChart(
      primaryXAxis: NumericAxis(
        isVisible: false,
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
        maximum: maxX,
        
      ),
      primaryYAxis: NumericAxis(
        isVisible: false,
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
        maximum: maxY, // Set maximum y-value
      ),
      plotAreaBorderWidth: 0,
      margin: const EdgeInsets.all(0), // Remove margin

      series: <CartesianSeries>[
        LineSeries<LineChartDataModel, double>(
          dataSource: widget.cdata,
          xValueMapper: (LineChartDataModel chartData, _) => chartData.time,
          yValueMapper: (LineChartDataModel chartData, _) => chartData.value,
          color: widget.lineColor,
          width: widget.lineWidth
        ),
      ],
    );
  }
}