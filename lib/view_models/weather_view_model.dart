import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/models/hourly_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/models/weekly_weather_model.dart';
import 'package:weather/repositories/weather_repository.dart';

class WeatherState {
  WeatherModel? currentLocationWeather;
  HourlyWeatherModel? hourlyWeather;
  WeeklyWeatherModel? weeklyWeather;
  final bool isLoading;
  final String? error;

  WeatherState({
    this.currentLocationWeather,
    this.hourlyWeather,
    this.weeklyWeather,
    this.isLoading = false,
    this.error,
  });

  WeatherState copyWith({
    WeatherModel? currentLocationWeather,
    HourlyWeatherModel? hourlyWeather,
    WeeklyWeatherModel? weeklyWeather,
    bool? isLoading,
    String? error,
  }) {
    return WeatherState(
      currentLocationWeather: currentLocationWeather ?? this.currentLocationWeather,
      hourlyWeather: hourlyWeather ?? this.hourlyWeather,
      weeklyWeather: weeklyWeather ?? this.weeklyWeather,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class WeatherViewModel extends StateNotifier<WeatherState> {
  final WeatherRepository _repository;

  WeatherViewModel(this._repository) : super(WeatherState()) {
    fetchAllWeather();
  }

  Future<void> fetchAllWeather() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final position = await _repository.getCurrentPosition();
      final (weather, hourly, weekly) = await _repository.getAllWeatherData(position);
      state = state.copyWith(
        currentLocationWeather: weather,
        hourlyWeather: hourly,
        weeklyWeather: weekly,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to fetch weather data: $e');
    }
  }
}