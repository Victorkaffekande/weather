import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/myWeather/weather_text.dart';
import 'package:weather/server.dart';
import 'package:weather_icons/weather_icons.dart';

import '../models.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  //String city =
  final DailyForecast _today = Server.getDailyForecast().first;

  String city = "default";

  setCity() async {
    print("set city");
    var a = await Server.getCity();
    setState(() {
      city = a!;
    });
  }

  @override
  void initState() {
    super.initState();
    setCity();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      builder: (context, snapshot) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 150, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeatherText(
                  text: city,
                  size: Size.large,
                ),
                WeatherText(
                  text:
                      "${_today.time.toString().split(" ")[0]} ${_today.getWeekday()}",
                  size: Size.small,
                ),
              ],
            ),
            _buildWeatherStats(_today)
          ],
        ),
      ),
    );
  }

  _buildWeatherStats(DailyForecast today) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WeatherText(
          text: "${today.temperature_2m_max}\u2103",
          size: Size.giga,
          fontWeight: FontWeight.w300,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Icon(
                today.weathercode.iconData,
                color: Colors.white,
                size: 50,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: SingleChildScrollView(
                    child: WeatherText(
                        text: today.weathercode.description,
                        size: Size.medium)),
              )
            ],
          ),
        ),
        //Break line
        Container(
          margin: EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(border: Border.all(color: Colors.white30)),
        ),
        Row(
          children: const [
            WeatherText(
              text: "80 m/s",
              size: Size.small,
            ),
          ],
        ),
      ],
    );
  }
}
