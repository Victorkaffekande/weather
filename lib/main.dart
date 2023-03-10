import 'package:flutter/material.dart';
import 'package:weather/myWeather/my_weather.dart';

void main() {
  runApp(HorizonsApp());
}

class HorizonsApp extends StatelessWidget {
  HorizonsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const ConstantScrollBehavior(),
        title: 'Horizons Weather',
        theme: ThemeData.dark(),
        home: const MyWeather());
  }
}



class ConstantScrollBehavior extends ScrollBehavior {
  const ConstantScrollBehavior();

  @override
  Widget buildScrollbar(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  TargetPlatform getPlatform(BuildContext context) => TargetPlatform.macOS;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
