import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repositories/weather_repository.dart';
import 'package:weather/utils/constants/text_constants.dart';

class SearchCityWeatherState {
  final bool isLoading;
  final List<WeatherModel> recentCityWeather;
  final String? error;

  SearchCityWeatherState({this.isLoading = false, required this.recentCityWeather, this.error});

  SearchCityWeatherState copyWith({bool? isLoading, List<WeatherModel>? recentCityWeather, String? error}) {
    return SearchCityWeatherState(
      isLoading: isLoading ?? this.isLoading,
      recentCityWeather: recentCityWeather ?? this.recentCityWeather,
      error: error ?? this.error,
    );
  }
}

class SearchCityWeatherViewModel extends StateNotifier<SearchCityWeatherState> {
  final WeatherRepository _repository;

  SearchCityWeatherViewModel(this._repository) : super(SearchCityWeatherState(recentCityWeather: [])) {
    loadRecentCityWeather();
  }

  Future<void> loadRecentCityWeather() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final recentCityWeather = await _repository.getRecentWeatherData();
      state = state.copyWith(isLoading: false, recentCityWeather: recentCityWeather);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: AppTextConstants.recentWeatherException);
    }
  }

  Future<void> fetchWeatherDataOfSearchedCity(String city) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final weatherData = await _repository.getWeatherForCity(city);
      await _repository.saveWeatherData(weatherData);
      await loadRecentCityWeather();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '${AppTextConstants.selectedLocationException} $city');
    }
  }
}
