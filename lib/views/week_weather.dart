import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';


import 'package:weather/util/weather_text.dart';

import '../models/forecast.dart';
import '../server.dart';
import '../util/glass.dart';

class WeekWeather extends StatefulWidget {
  final Forecast forecast;
  final Placemark placemark;

  const WeekWeather(this.forecast, this.placemark, {Key? key})
      : super(key: key);

  @override
  State<WeekWeather> createState() => _WeekWeatherState();
}

class _WeekWeatherState extends State<WeekWeather> {
  @override
  Widget build(BuildContext context) {
    final forecasts = widget.forecast.daily;
    final city = widget.placemark.locality;

    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          WeatherText(text: city!, size: Size.medium),
          ListView.builder(
            shrinkWrap: true,
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
                            text:
                                "${forecast.getWeekday()} ${forecast.time.day}/${forecast.time.month}",
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
          ),
        ],
      ),
    );
  }
}
