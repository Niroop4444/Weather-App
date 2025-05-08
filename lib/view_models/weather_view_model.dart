import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/models/hourly_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/models/weekly_weather_model.dart';
import 'package:weather/repositories/weather_repository.dart';
import 'package:weather/utils/constants/text_constants.dart';

class WeatherState {
  WeatherModel? currentLocationWeather;
  HourlyWeatherModel? hourlyWeather;
  WeeklyWeatherModel? weeklyWeather;

  final bool isLoadingCurrent;
  final bool isLoadingHourly;
  final bool isLoadingWeekly;
  final String? error;

  WeatherState({
    this.currentLocationWeather,
    this.hourlyWeather,
    this.weeklyWeather,
    this.isLoadingCurrent = false,
    this.isLoadingHourly = false,
    this.isLoadingWeekly = false,
    this.error,
  });

  WeatherState copyWith({
    WeatherModel? currentLocationWeather,
    HourlyWeatherModel? hourlyWeather,
    WeeklyWeatherModel? weeklyWeather,
    bool? isLoadingCurrent,
    bool? isLoadingHourly,
    bool? isLoadingWeekly,
    String? error,
  }) {
    return WeatherState(
      currentLocationWeather: currentLocationWeather ?? this.currentLocationWeather,
      hourlyWeather: hourlyWeather ?? this.hourlyWeather,
      weeklyWeather: weeklyWeather ?? this.weeklyWeather,
      isLoadingCurrent: isLoadingCurrent ?? this.isLoadingCurrent,
      isLoadingHourly: isLoadingHourly ?? this.isLoadingHourly,
      isLoadingWeekly: isLoadingWeekly ?? this.isLoadingWeekly,
      error: error ?? this.error,
    );
  }
}

class WeatherViewModel extends StateNotifier<WeatherState> {
  final WeatherRepository _repository;

  WeatherViewModel(this._repository) : super(WeatherState());

  Future<void> fetchCurrentWeather() async {
    state = state.copyWith(isLoadingCurrent: true);
    try {
      final weather = await _repository.getWeatherDetailsOfCurrentLocation();
      state = state.copyWith(currentLocationWeather: weather, isLoadingCurrent: false);
    } catch (e) {
      state = state.copyWith(isLoadingCurrent: false, error: '${AppTextConstants.currentLocationException}: $e');
    }
  }

  Future<void> fetchHourlyWeather() async {
    state = state.copyWith(isLoadingHourly: true);
    try {
      final hourly = await _repository.getHourlyWeatherDetailsOfCurrentLocation();
      state = state.copyWith(hourlyWeather: hourly, isLoadingHourly: false);
    } catch (e) {
      state = state.copyWith(isLoadingHourly: false, error: '${AppTextConstants.currentLocationHourlyException}: $e');
    }
  }

  Future<void> fetchWeeklyWeather() async {
    state = state.copyWith(isLoadingWeekly: true);
    try {
      final weekly = await _repository.getWeeklyWeatherOfCurrentLocation();
      state = state.copyWith(weeklyWeather: weekly, isLoadingWeekly: false);
    } catch (e) {
      state = state.copyWith(isLoadingWeekly: false, error: '${AppTextConstants.currentLocationWeeklyException}: $e');
    }
  }
}
