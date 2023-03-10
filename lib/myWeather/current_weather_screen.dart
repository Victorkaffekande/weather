import 'package:flutter/material.dart';

import 'current_weather.dart';
import 'current_weather_graphs.dart';

class CurrentWeatherScreen extends StatelessWidget {
  const CurrentWeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
        children: const [
        CurrentWeather(),
     CurrentWeatherGraphs()
    ]);
  }
}
