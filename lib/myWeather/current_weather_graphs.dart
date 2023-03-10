import 'package:flutter/material.dart';
import 'package:weather/models.dart';
import 'package:weather/myWeather/charts/precipitation_chart.dart';
import 'package:weather/myWeather/charts/temperature_chart.dart';

import '../server.dart';

class CurrentWeatherGraphs extends StatefulWidget {
  const CurrentWeatherGraphs({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherGraphs> createState() => _CurrentWeatherGraphsState();
}

class _CurrentWeatherGraphsState extends State<CurrentWeatherGraphs> {
  List<HourlyForecast> forecast = Server.getHourlyForecast();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TemperatureChart(forecast),
        PrecipitationChart(forecast)
      ],
    );
  }
}
