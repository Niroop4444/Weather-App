import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/utils/constants/get_weather_icon.dart';
import 'package:weather/utils/constants/image_strings.dart';
import 'package:weather/utils/constants/text_constants.dart';
import 'package:weather/view/widgets/details_item.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherModel weatherModel;

  const CurrentWeather({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(weatherModel.cityName, style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "${weatherModel.temperature.toInt()}${AppTextConstants.degreeCelsius}",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 42),
                  ),
                  Text(weatherModel.description, style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              Image.asset(getWeatherIcon(weatherCode: weatherModel.id), width: 90),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DetailsItem(
                      icon: AppImages.temperature,
                      title: AppTextConstants.feelsLike,
                      value: "${weatherModel.feelsLike.toInt()}${AppTextConstants.degreeCelsius}",
                    ),
                    DetailsItem(
                      icon: AppImages.wind,
                      title: AppTextConstants.wind,
                      value: "${weatherModel.windSpeed.toInt()}${AppTextConstants.meterPerSecond}",
                    ),
                    DetailsItem(
                      icon: AppImages.humidity,
                      title: AppTextConstants.humidity,
                      value: "${weatherModel.humidity.toInt()}%",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
