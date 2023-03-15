import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../models.dart';
import 'current_weather.dart';
import 'current_weather_graphs.dart';

class CurrentWeatherScreen extends StatelessWidget {
  final Forecast _forecast;
  final Placemark _placemark;


  CurrentWeatherScreen(this._forecast, this._placemark);

  @override
  Widget build(BuildContext context) {
    return PageView(children: [
      CurrentWeather(_forecast,_placemark),
      CurrentWeatherGraphs(),
    ]);
  }
}
