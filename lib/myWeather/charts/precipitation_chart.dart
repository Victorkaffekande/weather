
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather/myWeather/util/glass.dart';

import '../../models.dart';

class PrecipitationChart extends StatelessWidget {
  final List<HourlyForecast> forecast;
  const PrecipitationChart(this.forecast, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Glass(
      child: SfCartesianChart(
        title: ChartTitle(text: 'Precipitation'),
        primaryXAxis: DateTimeAxis(),
        primaryYAxis: NumericAxis(title: AxisTitle(text: 'mm')),
        series: [
          ColumnSeries(
            dataSource: forecast.take(24).toList(),
            xValueMapper: (datum, index) => datum.time,
            yValueMapper: (datum, index) => datum.precipitation,
            pointColorMapper: (datum, index) => Color.alphaBlend(
              Colors.white.withOpacity(datum.precipitation_probability / 100),
              Colors.blueGrey,
            ),
          )
        ],
      ),
    );
  }
}