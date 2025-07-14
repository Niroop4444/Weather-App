import 'package:geolocator/geolocator.dart';
import 'package:weather/models/hourly_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/models/weekly_weather_model.dart';

abstract class WeatherRepository {
  Future<Position> getCurrentPosition();
  Future<(WeatherModel, HourlyWeatherModel, WeeklyWeatherModel)> getAllWeatherData(Position position);
  Future<WeatherModel> getWeatherForCity(String city);
  Future<HourlyWeatherModel> getHourlyWeatherDetailsOfSearchedLocation(double lat, double lon);
  Future<WeeklyWeatherModel> getWeeklyWeatherOfSearchedLocation(double lat, double lon);
  Future<List<WeatherModel>> getRecentWeatherData();
  Future<void> saveWeatherData(WeatherModel weather);
}