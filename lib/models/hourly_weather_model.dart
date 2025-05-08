import 'package:hive/hive.dart';

part 'hourly_weather_model.g.dart';

@HiveType(typeId: 0)
class HourlyWeatherModel {
  @HiveField(0)
  final List<HourlyWeatherItem> list;

  HourlyWeatherModel({required this.list});

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<HourlyWeatherItem> weatherList =
    list.map((item) => HourlyWeatherItem.fromJson(item)).toList();

    return HourlyWeatherModel(list: weatherList);
  }
}

@HiveType(typeId: 1)
class HourlyWeatherItem {
  @HiveField(0)
  final int dt;

  @HiveField(1)
  final double temp;

  HourlyWeatherItem({required this.dt, required this.temp});

  factory HourlyWeatherItem.fromJson(Map<String, dynamic> json) {
    var temp = json['main']['temp'];
    return HourlyWeatherItem(
      dt: json['dt'],
      temp: (temp is int) ? temp.toDouble() : temp as double,
    );
  }
}
