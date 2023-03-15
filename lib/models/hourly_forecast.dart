class HourlyForecast {
  final DateTime time;
  final double temperature_2m;
  final double apparent_temperature;
  final double precipitation;
  final int precipitation_probability;

  HourlyForecast(
      {required this.time,
        required this.temperature_2m,
        required this.apparent_temperature,
        required this.precipitation,
        required this.precipitation_probability});

  static List<HourlyForecast> fromJson(Map<String, dynamic> hourly) {
    final times = hourly['time'] as List<dynamic>;
    final temperature_2m = hourly['temperature_2m'] as List<dynamic>;
    final apparent_temperature =
    hourly['apparent_temperature'] as List<dynamic>;
    final precipitation_probability =
    hourly['precipitation_probability'] as List<dynamic>;
    final precipitation = hourly['precipitation'] as List<dynamic>;
    return List.generate(
        times.length,
            (index) => HourlyForecast(
            time: DateTime.parse(times[index]),
            temperature_2m: temperature_2m[index],
            apparent_temperature: apparent_temperature[index],
            precipitation: precipitation[index],
            precipitation_probability: precipitation_probability[index]));
  }
}