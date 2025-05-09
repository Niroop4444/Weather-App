import 'package:weather/models/hourly_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/models/weekly_weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeatherDetailsOfCurrentLocation();
  Future<HourlyWeatherModel> getHourlyWeatherDetailsOfCurrentLocation();
  Future<HourlyWeatherModel> getHourlyWeatherDetailsOfSearchedLocation(double lat, double lon);
  Future<WeeklyWeatherModel> getWeeklyWeatherOfCurrentLocation();
  Future<WeeklyWeatherModel> getWeeklyWeatherOfSearchedLocation(double lat, double lon);
  Future<WeatherModel> getWeatherForCity(String city);
  Future<List<WeatherModel>> getRecentWeatherData();
  Future<void> saveWeatherData(WeatherModel weather);
}