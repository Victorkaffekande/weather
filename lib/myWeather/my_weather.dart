import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/myWeather/current_weather.dart';
import 'package:weather/myWeather/current_weather_screen.dart';
import 'package:weather/myWeather/forecast_bloc.dart';
import 'package:weather_icons/weather_icons.dart';

import '../models.dart';
import '../server.dart';
import 'week_weather.dart';

class MyWeather extends StatefulWidget {
  const MyWeather({Key? key}) : super(key: key);

  @override
  State<MyWeather> createState() => _MyWeatherState();
}

class _MyWeatherState extends State<MyWeather> {
  final _tabs = [
    CurrentWeatherScreen.new,
    WeekWeather.new,
  ];
  int _selectedIndex = 0;

  @override
  void initState() {
    final bloc = BlocProvider.of<ForecastBloc>(context);
    bloc.add(LoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ForecastBloc>(context);
    return StreamBuilder(
      stream: bloc.stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          //appbar scrolldown refresh
          body: Align(
            alignment: Alignment.topCenter,
            child: Stack(children: [
              //_buildBackground(),//TODO FIX
              //semi transparent layer
              Container(
                decoration: const BoxDecoration(color: Colors.black38),
              ),
              //display layer
              _buildTab(snapshot)
            ]),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            currentIndex: _selectedIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.window_outlined), label: 'Today'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_view_week_outlined), label: 'Week'),
            ],
            onTap: (value) {
              _selectedIndex = value;
              setState(() {});
            },
          ),
        );
      },
    );
  }

  _buildBackground(DailyForecast forecast) {
    //TODO FIX SCUFFED
    var x = forecast.weathercode.numeric;
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

  _buildTab(AsyncSnapshot snapshot) {
    print(snapshot);
    if (snapshot.data is ForecastState) {
      return _tabs.elementAt(_selectedIndex).call(
          (snapshot.data as ForecastState).forecast,
          (snapshot.data as ForecastState).placemark);
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
