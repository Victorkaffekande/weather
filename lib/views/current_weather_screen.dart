import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../models/daily_forecast.dart';
import '../models/forecast.dart';
import '../views/current_weather.dart';
import '../views/current_weather_graphs.dart';

class CurrentWeatherScreen extends StatelessWidget {
  final Forecast _forecast;
  final Placemark _placemark;

  CurrentWeatherScreen(this._forecast, this._placemark);

  @override
  Widget build(BuildContext context) {
    final today = _forecast.daily.first;
    return Stack(
      children: [
        _buildBackground(today),
        Container(
          decoration: const BoxDecoration(color: Colors.black38),
        ),
        PageView(children: [
          CurrentWeather(_forecast, _placemark),
          CurrentWeatherGraphs(_forecast),
        ]),
      ],
    );
  }

  _buildBackground(DailyForecast today) {
    //TODO FIX SCUFFED cringe
    var x = today.weathercode.numeric;
    var imgString = "assets/";

    if (x < 2) {
      imgString += "sunny.jpg";
    } else if (x <= 48) {
      imgString += "cloudy.jpeg";
    } else if (x <= 66 || x > 77 && x < 85) {
      imgString += "rainy.jpg";
    } else if (x <= 77 || x >= 84 && x <= 85) {
      imgString += "snow.jpg"; //snow
    } else if (x <= 99) {
      imgString += "thunder.jpg"; // THUNDER
    }
    //sunny
    //rain
    //snow
    //thunder
    //cloudy
    return Image.asset(
      imgString,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
