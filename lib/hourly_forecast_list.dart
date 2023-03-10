import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather/models.dart';

import 'myWeather/charts/precipitation_chart.dart';
import 'myWeather/charts/temperature_chart.dart';
import 'server.dart';

class HourlyForecastList extends StatelessWidget {
  const HourlyForecastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecast = Server.getHourlyForecast();
    return SliverList(
      delegate: SliverChildListDelegate.fixed([
        Card(child: TemperatureChart(forecast)),
        Card(child: PrecipitationChart(forecast)),
      ]),
    );
  }
}



