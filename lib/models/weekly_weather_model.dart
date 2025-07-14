import 'package:hive/hive.dart';

part 'weekly_weather_model.g.dart';

@HiveType(typeId: 0)
class WeeklyWeatherModel {
  @HiveField(0)
  final double latitude;

  @HiveField(1)
  final double longitude;

  @HiveField(2)
  final double elevation;

  @HiveField(3)
  final String timezone;

  @HiveField(4)
  final String timezoneAbbreviation;

  @HiveField(5)
  final CurrentUnits? currentUnits;

  @HiveField(6)
  final Current? current;

  @HiveField(7)
  final DailyUnits dailyUnits;

  @HiveField(8)
  final Daily daily;

  WeeklyWeatherModel({
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.timezone,
    required this.timezoneAbbreviation,
    this.currentUnits,
    this.current,
    required this.dailyUnits,
    required this.daily,
  });

  factory WeeklyWeatherModel.fromJson(Map<String, dynamic> json) {
    return WeeklyWeatherModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
      elevation: json['elevation'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      currentUnits: json['current_units'] != null
          ? CurrentUnits.fromJson(json['current_units'])
          : null,
      current:
          json['current'] != null ? Current.fromJson(json['current']) : null,
      dailyUnits: DailyUnits.fromJson(json['daily_units']),
      daily: Daily.fromJson(json['daily']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'elevation': elevation,
      'timezone': timezone,
      'timezone_abbreviation': timezoneAbbreviation,
      'current_units': currentUnits?.toJson(),
      'current': current?.toJson(),
      'daily_units': dailyUnits.toJson(),
      'daily': daily.toJson(),
    };
  }
}

@HiveType(typeId: 1)
class CurrentUnits {
  @HiveField(0)
  final String time;

  @HiveField(1)
  final String interval;

  CurrentUnits({required this.time, required this.interval});

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      time: json['time'],
      interval: json['interval'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'interval': interval,
    };
  }
}

@HiveType(typeId: 2)
class Current {
  @HiveField(0)
  final String time;

  @HiveField(1)
  final int interval;

  Current({required this.time, required this.interval});

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      time: json['time'],
      interval: json['interval'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'interval': interval,
    };
  }
}

@HiveType(typeId: 3)
class DailyUnits {
  @HiveField(0)
  final String time;

  @HiveField(1)
  final String weatherCode;

  @HiveField(2)
  final String temperature2mMax;

  @HiveField(3)
  final String temperature2mMin;

  DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json['time'],
      weatherCode: json['weather_code'],
      temperature2mMax: json['temperature_2m_max'],
      temperature2mMin: json['temperature_2m_min'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'weather_code': weatherCode,
      'temperature_2m_max': temperature2mMax,
      'temperature_2m_min': temperature2mMin,
    };
  }
}

@HiveType(typeId: 4)
class Daily {
  @HiveField(0)
  final List<String> time;

  @HiveField(1)
  final List<int> weatherCode;

  @HiveField(2)
  final List<double> temperature2mMax;

  @HiveField(3)
  final List<double> temperature2mMin;

  Daily({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: List<String>.from(json['time']),
      weatherCode: List<int>.from(json['weather_code']),
      temperature2mMax: List<double>.from(json['temperature_2m_max']),
      temperature2mMin: List<double>.from(json['temperature_2m_min']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'weather_code': weatherCode,
      'temperature_2m_max': temperature2mMax,
      'temperature_2m_min': temperature2mMin,
    };
  }
}
