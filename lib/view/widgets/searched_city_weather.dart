import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/utils/constants/get_weather_icon.dart';
import 'package:weather/utils/constants/text_constants.dart';
import 'package:weather/view/screens/searched_city_weather_details_screen.dart';

class SearchedCityWeather extends StatelessWidget {
  final WeatherModel weather;

  const SearchedCityWeather({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => SearchedCityWeatherDetailsScreen(weather: weather)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(getWeatherIcon(weatherCode: weather.id), width: 70, height: 50),
            Text(weather.cityName, style: Theme.of(context).textTheme.bodyMedium),
            Text(
              '${weather.temperature.toInt()}${AppTextConstants.degreeCelsius}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(weather.description, style: Theme.of(context).textTheme.bodySmall),
            Text(
              '${AppTextConstants.humidity}: ${weather.humidity.toInt()}%',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
