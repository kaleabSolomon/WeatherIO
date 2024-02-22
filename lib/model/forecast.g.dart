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
      condition: fields[1] as Condition,
      weatherDate: (fields[2] as List).cast<WeatherData>(),
    );
  }

  @override
  void write(BinaryWriter writer, Forecast obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.city)
      ..writeByte(1)
      ..write(obj.condition)
      ..writeByte(2)
      ..write(obj.weatherDate);
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
