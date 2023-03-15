import 'package:flutter/material.dart';


import '../charts/precipitation_chart.dart';
import '../charts/temperature_chart.dart';
import '../models/forecast.dart';
import '../models/hourly_forecast.dart';
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
