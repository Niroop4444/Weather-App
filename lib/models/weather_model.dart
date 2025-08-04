import 'package:hive/hive.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 0)
class WeatherModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String cityName;

  @HiveField(2)
  final double temperature;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final double humidity;

  @HiveField(5)
  final DateTime timeStamp;

  @HiveField(6)
  final double minTemp;

  @HiveField(7)
  final double maxTemp;

  @HiveField(8)
  final double windSpeed;

  @HiveField(9)
  final String sunrise;

  @HiveField(10)
  final String sunset;

  @HiveField(11)
  final double feelsLike;

  @HiveField(12)
  final double lat;

  @HiveField(13)
  final double lon;

  WeatherModel({
    required this.id,
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.timeStamp,
    required this.minTemp,
    required this.maxTemp,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
    required this.feelsLike,
    required this.lat,
    required this.lon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['weather'][0]['id'],
      cityName: json['name'],
      temperature: (json['main']['temp'] as num).toDouble(),
      description: json['weather'][0]['description'],
      humidity: (json['main']['humidity'] as num).toDouble(),
      timeStamp: DateTime.now(),
      minTemp: (json['main']['temp_min'] as num).toDouble(),
      maxTemp: (json['main']['temp_max'] as num).toDouble(),
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      sunrise:
          DateTime.fromMillisecondsSinceEpoch(
            json['sys']['sunrise'] * 1000,
          ).toString(),
      sunset:
          DateTime.fromMillisecondsSinceEpoch(
            json['sys']['sunset'] * 1000,
          ).toString(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      lat: (json['coord']['lat'] as num).toDouble(),
      lon: (json['coord']['lon'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cityName': cityName,
      'temperature': temperature,
      'description': description,
      'humidity': humidity,
      'timeStamp': timeStamp.toIso8601String(),
      'minTemp': minTemp,
      'maxTemp': maxTemp,
      'windSpeed': windSpeed,
      'sunrise': sunrise,
      'sunset': sunset,
      'feelsLike': feelsLike,
      'lat': lat,
      'lon': lon,
    };
  }
}
