import 'package:flutter/material.dart';
import 'package:weather/myWeather/current_weather.dart';
import 'package:weather_icons/weather_icons.dart';

import '../models.dart';
import '../server.dart';

class MyWeather extends StatefulWidget {
  const MyWeather({Key? key}) : super(key: key);

  @override
  State<MyWeather> createState() => _MyWeatherState();
}

class _MyWeatherState extends State<MyWeather> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Server.refresh(),
      builder: (context, snapshot) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("filler appbar"),
          leading: Icon(WeatherIcons.alien),
        ),
        //appbar scrolldown refresh
        body: Align(
          alignment: Alignment.topCenter,
          child: Stack(children: [
            //TODO REPLACE BASED ON WEATHER
            Image.asset(
              "assets/night.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            //semi transparent layer
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            //display layer
            const CurrentWeather()
          ]),
        ),
      ),
    );

    //location
    //current weather
  }
}
