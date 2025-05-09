// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherModelAdapter extends TypeAdapter<WeatherModel> {
  @override
  final int typeId = 0;

  @override
  WeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherModel(
      id: fields[0] as int,
      cityName: fields[1] as String,
      temperature: fields[2] as double,
      description: fields[3] as String,
      humidity: fields[4] as double,
      timeStamp: fields[5] as DateTime,
      minTemp: fields[6] as double,
      maxTemp: fields[7] as double,
      windSpeed: fields[8] as double,
      sunrise: fields[9] as String,
      sunset: fields[10] as String,
      feelsLike: fields[11] as double,
      lat: fields[12] as double,
      lon: fields[13] as double,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.cityName)
      ..writeByte(2)
      ..write(obj.temperature)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.humidity)
      ..writeByte(5)
      ..write(obj.timeStamp)
      ..writeByte(6)
      ..write(obj.minTemp)
      ..writeByte(7)
      ..write(obj.maxTemp)
      ..writeByte(8)
      ..write(obj.windSpeed)
      ..writeByte(9)
      ..write(obj.sunrise)
      ..writeByte(10)
      ..write(obj.sunset)
      ..writeByte(11)
      ..write(obj.feelsLike)
      ..writeByte(12)
      ..write(obj.lat)
      ..writeByte(13)
      ..write(obj.lon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
