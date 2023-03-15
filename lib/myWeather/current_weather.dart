import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/myWeather/forecast_bloc.dart';
import 'package:weather/myWeather/weather_text.dart';
import 'package:weather/server.dart';
import 'package:weather_icons/weather_icons.dart';

import '../models.dart';

class CurrentWeather extends StatefulWidget {
  final Forecast forecast;
  final Placemark placemark;

  const CurrentWeather(this.forecast, this.placemark, {Key? key})
      : super(key: key);

  @override
  State<CurrentWeather> createState() =>
      _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {

  @override
  Widget build(BuildContext context) {
    final DailyForecast today = widget.forecast.daily.first;
    final HourlyForecast now = widget.forecast.hourly.first;
    final city = widget.placemark.locality;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 150, 10, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCityDate(today, city!),
          _buildWeatherStats(now, today)
        ],
      ),
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

  _buildCityDate(DailyForecast today, String city) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WeatherText(
          text: city,
          size: Size.large,
        ),
        WeatherText(
          text: "${today.time.toString().split(" ")[0]} ${today.getWeekday()}",
          size: Size.small,
        ),
      ],
    );
  }

  _buildWeatherStats(HourlyForecast now, DailyForecast today) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WeatherText(
          text: "${now.temperature_2m}\u2103",
          size: Size.giga,
          fontWeight: FontWeight.w300,
        ),
        WeatherText(
          text: "Feels like ${now.apparent_temperature}\u2103",
          size: Size.medium,
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
          margin: EdgeInsets.fromLTRB(0, 40, 0, 10),
          decoration: BoxDecoration(border: Border.all(color: Colors.white30)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSingleStat(WeatherIcons.rain, "${now.precipitation}mm"),
            _buildSingleStat(
                WeatherIcons.rain, "${now.precipitation_probability}%"),
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
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: WeatherText(
              text: s,
              size: Size.small,
            ),
          ),
        ],
      ),
    );
  }
}
