// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConditionAdapter extends TypeAdapter<Condition> {
  @override
  final int typeId = 1;

  @override
  Condition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Condition(
      condition: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Condition obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.condition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
