import 'package:flutter/material.dart';
import 'package:weather/utils/constants/get_weather_icon.dart';
import 'package:weather/utils/constants/text_constants.dart';

class DayWeatherItem extends StatelessWidget {
  final int id;
  final String day;
  final String minTemp;
  final String maxTemp;

  const DayWeatherItem({super.key, required this.id, required this.day, required this.minTemp, required this.maxTemp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(day, style: Theme.of(context).textTheme.bodyMedium),
          Text(
            "$maxTemp${AppTextConstants.degreeCelsius} / $minTemp${AppTextConstants.degreeCelsius}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Image.asset(
            getWeatherIcon2(id),
            width: 60,
          )
        ],
      ),
    );
  }
}
