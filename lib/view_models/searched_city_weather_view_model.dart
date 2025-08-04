import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/models/hourly_weather_model.dart';
import 'package:weather/models/weekly_weather_model.dart';
import 'package:weather/repositories/weather_repository.dart';
import 'package:weather/utils/constants/text_constants.dart';

class SearchedCityWeatherState {
  HourlyWeatherModel? hourlyWeather;
  WeeklyWeatherModel? weeklyWeather;
  final bool isLoadingHourly;
  final bool isLoadingWeekly;
  final String? error;

  SearchedCityWeatherState({
    this.hourlyWeather,
    this.weeklyWeather,
    this.isLoadingHourly = false,
    this.isLoadingWeekly = false,
    this.error,
  });

  SearchedCityWeatherState copyWith({
    HourlyWeatherModel? hourlyWeather,
    WeeklyWeatherModel? weeklyWeather,
    bool? isLoadingHourly,
    bool? isLoadingWeekly,
    String? error,
  }) {
    return SearchedCityWeatherState(
      hourlyWeather: hourlyWeather ?? this.hourlyWeather,
      weeklyWeather: weeklyWeather ?? this.weeklyWeather,
      isLoadingHourly: isLoadingHourly ?? this.isLoadingHourly,
      isLoadingWeekly: isLoadingWeekly ?? this.isLoadingWeekly,
      error: error ?? this.error,
    );
  }
}

class SearchedCityWeatherViewModel
    extends StateNotifier<SearchedCityWeatherState> {
  final WeatherRepository _repository;

  SearchedCityWeatherViewModel(this._repository)
    : super(SearchedCityWeatherState());

  Future<void> fetchHourlyWeather(double lat, double lon) async {
    state = state.copyWith(isLoadingHourly: true);
    try {
      final hourly = await _repository
          .getHourlyWeatherDetailsOfSearchedLocation(lat, lon);
      state = state.copyWith(
        hourlyWeather: hourly,
        isLoadingHourly: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingHourly: false,
        error: '${AppTextConstants.currentLocationHourlyException}: $e',
      );
    }
  }

  Future<void> fetchWeeklyWeather(double lat, double lon) async {
    state = state.copyWith(isLoadingWeekly: true);
    try {
      final weekly = await _repository.getWeeklyWeatherOfSearchedLocation(
        lat,
        lon,
      );
      state = state.copyWith(
        weeklyWeather: weekly,
        isLoadingWeekly: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingWeekly: false,
        error: '${AppTextConstants.currentLocationWeeklyException}: $e',
      );
    }
  }
}
