// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HourlyWeatherModelAdapter extends TypeAdapter<HourlyWeatherModel> {
  @override
  final int typeId = 0;

  @override
  HourlyWeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HourlyWeatherModel(
      list: (fields[0] as List).cast<HourlyWeatherItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, HourlyWeatherModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourlyWeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HourlyWeatherItemAdapter extends TypeAdapter<HourlyWeatherItem> {
  @override
  final int typeId = 1;

  @override
  HourlyWeatherItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HourlyWeatherItem(
      dt: fields[0] as int,
      temp: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, HourlyWeatherItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.temp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourlyWeatherItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
