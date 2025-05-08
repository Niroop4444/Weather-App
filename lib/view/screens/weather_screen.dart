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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = ref.read(weatherViewModelProvider.notifier);
      notifier.fetchCurrentWeather();
      notifier.fetchHourlyWeather();
      notifier.fetchWeeklyWeather();
    });
  }

  Future<void> _refreshWeather() async {
    final notifier = ref.read(weatherViewModelProvider.notifier);
    notifier.fetchCurrentWeather();
    notifier.fetchHourlyWeather();
    notifier.fetchWeeklyWeather();
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
              Text(
                weatherState.error!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.error),
              ),

            if (weatherState.isLoadingCurrent || weatherState.isLoadingHourly || weatherState.isLoadingWeekly)
              WeatherLoader(),
            if (weatherState.currentLocationWeather != null)
              CurrentWeather(weatherModel: weatherState.currentLocationWeather!),
            if (weatherState.hourlyWeather != null)
              HourlyWeather(hourlyWeatherModel: weatherState.hourlyWeather!),
            if (weatherState.weeklyWeather != null)
              WeeklyWeather(weeklyWeatherModel: weatherState.weeklyWeather!),
          ],
        ),
      ),
    );
  }
}
