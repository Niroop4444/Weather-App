import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/view/widgets/current_weather.dart';
import 'package:weather/view/widgets/hourly_weather.dart';
import 'package:weather/view/widgets/weather_loader.dart';
import 'package:weather/view/widgets/weekly_weather.dart';

class SearchedCityWeatherDetailsScreen extends ConsumerStatefulWidget {
  final WeatherModel weather;

  SearchedCityWeatherDetailsScreen({super.key, required this.weather});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchedCityWeatherDetailsScreen();
}

class _SearchedCityWeatherDetailsScreen extends ConsumerState<SearchedCityWeatherDetailsScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchedWeatherViewModelProvider.notifier).fetchHourlyWeather(widget.weather.lat, widget.weather.lon);
      ref.read(searchedWeatherViewModelProvider.notifier).fetchWeeklyWeather(widget.weather.lat, widget.weather.lon);
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchedWeatherState = ref.watch(searchedWeatherViewModelProvider);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          if (searchedWeatherState.isLoadingHourly || searchedWeatherState.isLoadingWeekly) WeatherLoader(),
          CurrentWeather(weatherModel: widget.weather),
          if (searchedWeatherState.hourlyWeather != null)
            HourlyWeather(hourlyWeatherModel: searchedWeatherState.hourlyWeather!),
          if (searchedWeatherState.weeklyWeather != null)
            WeeklyWeather(weeklyWeatherModel: searchedWeatherState.weeklyWeather!),
        ],
      ),
    );
  }
}
