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
  final HourlyForecast _now = Server.getHourlyForecast().first;
  late String city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 150, 10, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildCityDate(), _buildWeatherStats()],
      ),
    );
  }

  _getCity() async {
    city = (await Server.getCity())!;
    print(city);
    return city;
  }

  _buildCityDate() {
    return FutureBuilder(
      future: _getCity(),
      builder: (context, snapshot) {
        if (snapshot.data == null) return CircularProgressIndicator();
        return Column(
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
        );
      },
    );
  }

  _buildWeatherStats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WeatherText(
          text: "${_now.temperature_2m}\u2103",
          size: Size.giga,
          fontWeight: FontWeight.w300,
        ),
        WeatherText(
          text: "Feels like ${_now.apparent_temperature}\u2103",
          size: Size.medium,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Icon(
                _today.weathercode.iconData,
                color: Colors.white,
                size: 50,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: SingleChildScrollView(
                    child: WeatherText(
                        text: _today.weathercode.description,
                        size: Size.medium)),
              )
            ],
          ),
        ),
        //Break line
        Container(
          margin: EdgeInsets.fromLTRB(0,40,0,10),
          decoration: BoxDecoration(border: Border.all(color: Colors.white30)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSingleStat(WeatherIcons.rain, "${_now.precipitation}mm"),
            _buildSingleStat(WeatherIcons.rain, "${_now.precipitation_probability}%"),
          ],
        ),
      ],
    );
  }

  _buildSingleStat(IconData icon, String s) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,color: Colors.white,size: 30,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: WeatherText(
              text:s,
              size: Size.small,
            ),
          ),
        ],
      ),
    );

  }
}
