// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeeklyWeatherModelAdapter extends TypeAdapter<WeeklyWeatherModel> {
  @override
  final int typeId = 0;

  @override
  WeeklyWeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeeklyWeatherModel(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
      elevation: fields[2] as double,
      timezone: fields[3] as String,
      timezoneAbbreviation: fields[4] as String,
      currentUnits: fields[5] as CurrentUnits?,
      current: fields[6] as Current?,
      dailyUnits: fields[7] as DailyUnits,
      daily: fields[8] as Daily,
    );
  }

  @override
  void write(BinaryWriter writer, WeeklyWeatherModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.elevation)
      ..writeByte(3)
      ..write(obj.timezone)
      ..writeByte(4)
      ..write(obj.timezoneAbbreviation)
      ..writeByte(5)
      ..write(obj.currentUnits)
      ..writeByte(6)
      ..write(obj.current)
      ..writeByte(7)
      ..write(obj.dailyUnits)
      ..writeByte(8)
      ..write(obj.daily);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeeklyWeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrentUnitsAdapter extends TypeAdapter<CurrentUnits> {
  @override
  final int typeId = 1;

  @override
  CurrentUnits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentUnits(
      time: fields[0] as String,
      interval: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentUnits obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.interval);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentUnitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrentAdapter extends TypeAdapter<Current> {
  @override
  final int typeId = 2;

  @override
  Current read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Current(
      time: fields[0] as String,
      interval: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Current obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.interval);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DailyUnitsAdapter extends TypeAdapter<DailyUnits> {
  @override
  final int typeId = 3;

  @override
  DailyUnits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyUnits(
      time: fields[0] as String,
      weatherCode: fields[1] as String,
      temperature2mMax: fields[2] as String,
      temperature2mMin: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DailyUnits obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.weatherCode)
      ..writeByte(2)
      ..write(obj.temperature2mMax)
      ..writeByte(3)
      ..write(obj.temperature2mMin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyUnitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DailyAdapter extends TypeAdapter<Daily> {
  @override
  final int typeId = 4;

  @override
  Daily read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Daily(
      time: (fields[0] as List).cast<String>(),
      weatherCode: (fields[1] as List).cast<int>(),
      temperature2mMax: (fields[2] as List).cast<double>(),
      temperature2mMin: (fields[3] as List).cast<double>(),
    );
  }

  @override
  void write(BinaryWriter writer, Daily obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.weatherCode)
      ..writeByte(2)
      ..write(obj.temperature2mMax)
      ..writeByte(3)
      ..write(obj.temperature2mMin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
