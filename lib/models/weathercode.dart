// 0 	Clear sky
// 1, 2, 3 	Mainly clear, partly cloudy, and overcast
// 45, 48 	Fog and depositing rime fog
// 51, 53, 55 	Drizzle: Light, moderate, and dense intensity
// 56, 57 	Freezing Drizzle: Light and dense intensity
// 61, 63, 65 	Rain: Slight, moderate and heavy intensity
// 66, 67 	Freezing Rain: Light and heavy intensity
// 71, 73, 75 	Snow fall: Slight, moderate, and heavy intensity
// 77 	Snow grains
// 80, 81, 82 	Rain showers: Slight, moderate, and violent
// 85, 86 	Snow showers slight and heavy
// 95 * 	Thunderstorm: Slight or moderate
// 96, 99 * 	Thunderstorm with slight and heavy hail
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

enum WeatherCode {
  ClearSky(0, 'Clear sky', WeatherIcons.day_sunny),

  MainlyClear(1, 'Mainly clear', WeatherIcons.day_sunny),
  PartlyCloudy(2, 'Partly cloudy', WeatherIcons.day_cloudy),
  Overcast(3, 'Overcast',  WeatherIcons.cloudy),

  Fog(45, 'Fog',  WeatherIcons.day_fog),
  DepositingRimeFog(48, 'Depositing rime fog',  WeatherIcons.fog),

  DrizzleLight(51, 'Drizzle: Light intensity',WeatherIcons.day_sprinkle),
  DrizzleModerate(53, 'Drizzle: Moderate intensity', WeatherIcons.day_showers),
  DrizzleDense(55, 'Drizzle: Dense intensity', WeatherIcons.day_showers),

  FreezingDrizzleLight(56, 'Freezing Drizzle: Light intensity', WeatherIcons.snow_wind),
  FreezingDrizzleDense(57, 'Freezing Drizzle: dense intensity',  WeatherIcons.snow_wind),

  RainSlight(61, 'Rain: Slight intensity', WeatherIcons.showers),
  RainModerate(63, 'Rain: Moderate intensity',  WeatherIcons.day_rain),
  RainHeavy(65, 'Rain: Heavy intensity',  WeatherIcons.rain),

  FreezingRainLight(66, 'Freezing Rain: Light intensity', WeatherIcons.showers),
  FreezingRainHeavy(66, 'Freezing Rain: Heavy intensity', WeatherIcons.rain_wind),

  SnowFallSlight(71, 'Snow fall: Slight intensity', WeatherIcons.day_snow),
  SnowFallModerate(73, 'Snow fall: Moderate intensity', WeatherIcons.day_snow),
  SnowFallHeavy(75, 'Snow fall: Heavy intensity', WeatherIcons.day_sleet),

  SnowGrains(77, 'Snow grains',  WeatherIcons.snowflake_cold),

  RainShowersSlight(80, 'Rain showers: Slight', WeatherIcons.showers),
  RainShowersModerate(81, 'Rain showers: Moderate',  WeatherIcons.showers),
  RainShowersVoilent(82, 'Rain showers: Violent', WeatherIcons.rain_wind),

  SnowShowersSlight(85, 'Snow showers: Slight',  WeatherIcons.snow),
  SnowShowersHeavy(86, 'Snow showers: Heavy', WeatherIcons.day_snow_thunderstorm),

  Thunerstorm(95, 'Thunderstorm: Slight or moderate',  WeatherIcons.thunderstorm),
  ThunderstormSlightHail(96, 'Thunderstorm with slight hail',  WeatherIcons.day_sleet_storm),
  ThunderstormHeavyHail(99, 'Thunderstorm with heavy hail',  WeatherIcons.day_sleet_storm),
  ;

  final int numeric;
  final String description;
  final IconData iconData;
  const WeatherCode(this.numeric, this.description, this.iconData);

  static final _map =
  Map.fromEntries(WeatherCode.values.map((e) => MapEntry(e.numeric, e)));
  factory WeatherCode.fromNumeric(int numeric) {
    return WeatherCode._map[numeric]!;
  }
}
