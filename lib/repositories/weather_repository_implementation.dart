import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:weather/models/hourly_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/models/weekly_weather_model.dart';
import 'package:weather/repositories/weather_repository.dart';
import 'package:weather/utils/constants/text_constants.dart';

class WeatherRepositoryImplementation implements WeatherRepository {
  final Dio dio;
  final Box<WeatherModel> weatherBox;
  final String apiKey;

  WeatherRepositoryImplementation({required this.dio, required this.weatherBox, required this.apiKey});

  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception(AppTextConstants.locationServiceDisabled);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception(AppTextConstants.locationPermissionsDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(AppTextConstants.locationPermissionsPermanentlyDenied);
    }

    return await Geolocator.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.best));
  }

  @override
  Future<WeatherModel> getWeatherDetailsOfCurrentLocation() async {
    Position currentPosition = await getCurrentPosition();

    try {
      final response = await dio.get(
        AppTextConstants.currentLocationWeatherUrl,
        queryParameters: {
          'lat': currentPosition.latitude,
          'lon': currentPosition.longitude,
          'appid': apiKey,
          'units': AppTextConstants.metric,
        },
      );
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('${AppTextConstants.currentLocationException} : $e');
    }
  }

  @override
  Future<HourlyWeatherModel> getHourlyWeatherDetailsOfCurrentLocation() async {
    Position currentPosition = await getCurrentPosition();

    try {
      final response = await dio.get(
        AppTextConstants.currentLocationHourlyForecastUrl,
        queryParameters: {
          'lat': currentPosition.latitude,
          'lon': currentPosition.longitude,
          'appid': apiKey,
          'units': AppTextConstants.metric,
        },
      );
      return HourlyWeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('${AppTextConstants.currentLocationHourlyException} : $e');
    }
  }

  @override
  Future<WeeklyWeatherModel> getWeeklyWeatherOfCurrentLocation() async {
    Position currentPosition = await getCurrentPosition();

    try {
      final response = await dio.get(
        AppTextConstants.currentLocationWeeklyWeatherUrl,
        queryParameters: {
          'current': '',
          'daily': '${AppTextConstants.weatherCode},${AppTextConstants.maxTemp},${AppTextConstants.minTemp}',
          'timezone': AppTextConstants.auto,
          'latitude': currentPosition.latitude,
          'longitude': currentPosition.longitude,
        },
      );
      return WeeklyWeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('${AppTextConstants.currentLocationHourlyException} : $e');
    }
  }

  @override
  Future<List<WeatherModel>> getRecentWeatherData() async {
    final weatherData = weatherBox.values.toList();
    weatherData.sort((a, b) => b.timeStamp.compareTo(a.timeStamp));
    return weatherData.take(4).toList();
  }

  @override
  Future<WeatherModel> getWeatherForCity(String city) async {
    try {
      final response = await dio.get(
        AppTextConstants.currentLocationWeatherUrl,
        queryParameters: {'q': city, 'appid': apiKey, 'units': AppTextConstants.metric},
      );
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('${AppTextConstants.selectedLocationException} $city $e');
    }
  }

  @override
  Future<void> saveWeatherData(WeatherModel weather) async {
    WeatherModel? existingWeatherData;

    try {
      existingWeatherData = weatherBox.values.firstWhere((element) => element.cityName == weather.cityName);
    } catch (e) {
      existingWeatherData = null;
    }

    if (existingWeatherData != null) {
      await existingWeatherData.delete();
    }

    await weatherBox.add(weather);

    final allWeather = await getRecentWeatherData();

    if (allWeather.length > 4) {
      for (var i = 4; i < allWeather.length; i++) {
        allWeather[i].delete();
      }
    }
  }

  @override
  Future<HourlyWeatherModel> getHourlyWeatherDetailsOfSearchedLocation(double lat, double lon) async {
    try {
      final response = await dio.get(
        AppTextConstants.currentLocationHourlyForecastUrl,
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'appid': apiKey,
          'units': AppTextConstants.metric,
        },
      );
      return HourlyWeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('${AppTextConstants.currentLocationHourlyException} : $e');
    }
  }

  @override
  Future<WeeklyWeatherModel> getWeeklyWeatherOfSearchedLocation(double lat, double lon) async {
    try {
      final response = await dio.get(
        AppTextConstants.currentLocationWeeklyWeatherUrl,
        queryParameters: {
          'current': '',
          'daily': '${AppTextConstants.weatherCode},${AppTextConstants.maxTemp},${AppTextConstants.minTemp}',
          'timezone': AppTextConstants.auto,
          'latitude': lat,
          'longitude': lon,
        },
      );
      return WeeklyWeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('${AppTextConstants.currentLocationHourlyException} : $e');
    }
  }
}
