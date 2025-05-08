import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather/models/hourly_weather_model.dart';
import 'package:weather/utils/constants/extensions.dart';
import 'package:weather/utils/constants/text_constants.dart';

class HourlyWeather extends StatelessWidget {
  final HourlyWeatherModel hourlyWeatherModel;

  const HourlyWeather({super.key, required this.hourlyWeatherModel});

  @override
  Widget build(BuildContext context) {
    var hourData = hourlyWeatherModel.list.take(9).toList();

    List<FlSpot> spots = [];
    List<double> tempValues = [];

    for (var weather in hourData) {
      tempValues.add(weather.temp);
      spots.add(FlSpot(weather.dt.toDouble(), weather.temp));
    }

    double minTemp = tempValues.reduce((a, b) => a < b ? a : b);
    double maxTemp = tempValues.reduce((a, b) => a > b ? a : b);

    minTemp -= 5;
    maxTemp += 5;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.all(20),
        width: hourData.length * 80,
        height: 250,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value == maxTemp || value == minTemp) {
                      return SizedBox();
                    }
                    return Text(
                      "${value.toStringAsFixed(0)}${AppTextConstants.degreeCelsius}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 8),
                    );
                  },
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value == maxTemp || value == minTemp) {
                      return SizedBox();
                    }
                    return Text(
                      "${value.toStringAsFixed(0)}${AppTextConstants.degreeCelsius}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 8),
                    );
                  },
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value == hourData.first.dt.toDouble() || value == hourData.last.dt.toDouble()) {
                      return SizedBox();
                    }
                    return Text(
                      value.toInt().toTime(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 8),
                    );
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: true),
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(tooltipBorder: BorderSide(color: Colors.transparent)),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                color: Colors.deepPurpleAccent,
                barWidth: 2,
                belowBarData: BarAreaData(show: false),
              ),
            ],
            minX: hourData.first.dt.toDouble(),
            minY: minTemp,
            maxY: maxTemp,
            maxX: hourData.last.dt.toDouble(),
          ),
        ),
      ),
    );
  }
}
