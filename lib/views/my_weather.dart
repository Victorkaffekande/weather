import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/blocs/forecast_bloc.dart';
import 'package:weather/views/week_weather.dart';

import 'current_weather_screen.dart';


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
          //appbar scrolldown refresh
          body: _buildTab(snapshot),
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
