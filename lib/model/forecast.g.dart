// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForecastAdapter extends TypeAdapter<Forecast> {
  @override
  final int typeId = 0;

  @override
  Forecast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Forecast(
      city: fields[0] as String,
      date: fields[1] as String,
      maxTemp: fields[2] as String,
      condition: fields[4] as String,
      sunDuration: fields[5] as String,
      windSpeed: fields[6] as String,
      rainHeight: fields[7] as String,
      minTemp: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Forecast obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.city)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.maxTemp)
      ..writeByte(3)
      ..write(obj.minTemp)
      ..writeByte(4)
      ..write(obj.condition)
      ..writeByte(5)
      ..write(obj.sunDuration)
      ..writeByte(6)
      ..write(obj.windSpeed)
      ..writeByte(7)
      ..write(obj.rainHeight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
