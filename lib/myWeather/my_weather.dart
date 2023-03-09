import 'package:flutter/material.dart';
import 'package:weather/myWeather/current_weather.dart';
import 'package:weather_icons/weather_icons.dart';

import '../models.dart';
import '../server.dart';
import 'WeekWeather.dart';

class MyWeather extends StatefulWidget {
  const MyWeather({Key? key}) : super(key: key);

  @override
  State<MyWeather> createState() => _MyWeatherState();
}

class _MyWeatherState extends State<MyWeather> {

  final _tabs = [
    CurrentWeather.new,
    WeekWeather.new,
  ];
  int _selectedIndex =1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "assets/cloudy.jpeg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          //semi transparent layer
          Container(
            decoration: const BoxDecoration(color: Colors.black38),
          ),
          //display layer
          FutureBuilder(
              future: Server.refresh(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CurrentWeather();
              }),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.window_outlined), label: 'Today'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_week_outlined), label: 'Week'),
      ],

      ),
    );
    //location
    //current weather
  }
}
