import 'package:flutter/material.dart';
import 'package:weather/models.dart';
import 'package:weather/myWeather/charts/precipitation_chart.dart';
import 'package:weather/myWeather/charts/temperature_chart.dart';

import '../server.dart';

class CurrentWeatherGraphs extends StatefulWidget {
  final Forecast forecast;

  const CurrentWeatherGraphs(this.forecast,{Key? key}) : super(key: key);

  @override
  State<CurrentWeatherGraphs> createState() => _CurrentWeatherGraphsState();
}

class _CurrentWeatherGraphsState extends State<CurrentWeatherGraphs> {

  @override
  Widget build(BuildContext context) {
    final List<HourlyForecast> forecast = widget.forecast.hourly;
    return ListView(
      children: [
        TemperatureChart(forecast),
        PrecipitationChart(forecast)
      ],
    );
  }
}
