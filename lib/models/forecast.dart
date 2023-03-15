import 'daily_forecast.dart';
import 'hourly_forecast.dart';

class Forecast{
  final List<DailyForecast> daily;
  final List<HourlyForecast> hourly;

  Forecast({
    required this.daily,
    required this.hourly,
  });
}