// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmidata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class bmidataAdapter extends TypeAdapter<bmidata> {
  @override
  final int typeId = 1;

  @override
  bmidata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return bmidata(
      gender: fields[0] as String?,
      height: fields[1] as double?,
      weight: fields[2] as double?,
      age: fields[3] as int?,
      name: fields[4] as String?,
      bmi: fields[5] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, bmidata obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.gender)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.bmi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is bmidataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
