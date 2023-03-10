import 'package:flutter/material.dart';
import 'package:weather/myWeather/util/glass.dart';
import 'package:weather/myWeather/weather_text.dart';

import '../server.dart';

class WeekWeather extends StatefulWidget {
  const WeekWeather({Key? key}) : super(key: key);

  @override
  State<WeekWeather> createState() => _WeekWeatherState();
}

class _WeekWeatherState extends State<WeekWeather> {
  @override
  Widget build(BuildContext context) {
    final forecasts = Server.getDailyForecast();

    return ListView.builder(
      itemCount: forecasts.length,
      itemBuilder: (BuildContext context, int index) {
        var forecast = forecasts[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Glass(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                WeatherText(
                  text: "${forecast.getWeekday()} ${forecast.time.day}/${forecast.time.month}",
                  size: Size.medium,
                  fontWeight: FontWeight.normal,
                ),
                Icon(
                  forecast.weathercode.iconData,
                  size: 40,
                ),
                WeatherText(
                    text:
                        "${forecast.temperature_2m_max} / ${forecast.temperature_2m_min}\u2103",
                    size: Size.medium)
              ]),
            ),
          ),
        );
      },
    );
  }
}
