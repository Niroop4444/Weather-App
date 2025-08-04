import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/utils/constants/colors.dart';
import 'package:weather/view/screens/search_screen.dart';
import 'package:weather/view/widgets/current_weather.dart';
import 'package:weather/view/widgets/hourly_weather.dart';
import 'package:weather/view/widgets/weather_loader.dart';
import 'package:weather/view/widgets/weekly_weather.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  Future<void> _refreshWeather() async {
    await ref.read(weatherViewModelProvider.notifier).fetchAllWeather(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen()));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshWeather,
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            if (weatherState.error != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  weatherState.error!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.error),
                ),
              ),
            if (weatherState.isLoading && !weatherState.isRefreshing)
              WeatherLoader()
            else ...[
              if (weatherState.currentLocationWeather != null)
                CurrentWeather(weatherModel: weatherState.currentLocationWeather!),
              if (weatherState.hourlyWeather != null)
                HourlyWeather(hourlyWeatherModel: weatherState.hourlyWeather!),
              if (weatherState.weeklyWeather != null)
                WeeklyWeather(weeklyWeatherModel: weatherState.weeklyWeather!),
            ]
          ],
        ),
      ),
    );
  }
}
