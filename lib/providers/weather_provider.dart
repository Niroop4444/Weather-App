import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repositories/weather_repository.dart';
import 'package:weather/repositories/weather_repository_implementation.dart';
import 'package:weather/utils/constants/text_constants.dart';
import 'package:weather/view_models/search_city_weather_view_model.dart';
import 'package:weather/view_models/weather_view_model.dart';

final dioProvider = Provider((ref) => Dio());

final weatherBoxProvider = Provider<Box<WeatherModel>>((ref) => throw UnimplementedError());

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final apiKey = dotenv.env[AppTextConstants.apiKey];

  if (apiKey == null) {
    throw Exception(AppTextConstants.apiKeyMissing);
  }

  return WeatherRepositoryImplementation(
    dio: ref.watch(dioProvider),
    weatherBox: ref.watch(weatherBoxProvider),
    apiKey: apiKey,
  );
});

final weatherViewModelProvider = StateNotifierProvider<WeatherViewModel, WeatherState>((ref) {
  return WeatherViewModel(ref.watch(weatherRepositoryProvider));
});

final searchWeatherViewModelProvider = StateNotifierProvider<SearchCityWeatherViewModel, SearchCityWeatherState>(
  (ref) {
    return SearchCityWeatherViewModel(ref.watch(weatherRepositoryProvider));
  },
);
