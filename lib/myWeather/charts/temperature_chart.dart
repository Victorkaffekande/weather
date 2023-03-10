import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather/myWeather/util/glass.dart';

import '../../models.dart';

class TemperatureChart extends StatelessWidget {
  final List<HourlyForecast> forecast;
  const TemperatureChart(this.forecast, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Glass(
      child: SfCartesianChart(
        title: ChartTitle(text: 'Temperature'),
        primaryXAxis: DateTimeAxis(),
        primaryYAxis: NumericAxis(title: AxisTitle(text: '°C')),
        legend: Legend(isVisible: true, position: LegendPosition.bottom),
        series: [
          SplineSeries(
              dataSource: forecast,
              xValueMapper: (element, index) => element.time,
              yValueMapper: (element, index) => element.temperature_2m,
              legendItemText: 'Air temp'),
          SplineSeries(
              dataSource: forecast,
              xValueMapper: (element, index) => element.time,
              yValueMapper: (element, index) => element.apparent_temperature,
              legendItemText: 'Feels-like'),
        ],
      ),
    );
  }
}