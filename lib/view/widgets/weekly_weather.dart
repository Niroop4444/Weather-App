import 'package:flutter/material.dart';
import 'package:weather/models/weekly_weather_model.dart';
import 'package:weather/utils/constants/extensions.dart';
import 'package:weather/view/widgets/day_weather_item.dart';

class WeeklyWeather extends StatelessWidget {
  final WeeklyWeatherModel weeklyWeatherModel;

  const WeeklyWeather({super.key, required this.weeklyWeatherModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: weeklyWeatherModel.daily.time.length,
        itemBuilder: (ctx, index) {
          return DayWeatherItem(
            id: weeklyWeatherModel.daily.weatherCode[index],
            day: DateTime.parse(weeklyWeatherModel.daily.time[index]).dayOfWeek,
            minTemp: weeklyWeatherModel.daily.temperature2mMin[index].toInt().toString(),
            maxTemp: weeklyWeatherModel.daily.temperature2mMax[index].toInt().toString(),
          );
        },
      ),
    );
  }
}
