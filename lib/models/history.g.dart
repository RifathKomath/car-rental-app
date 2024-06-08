// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class historyOfCarsAdapter extends TypeAdapter<historyOfCars> {
  @override
  final int typeId = 3;

  @override
  historyOfCars read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return historyOfCars(
      id: fields[0] as int?,
      history: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, historyOfCars obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.history);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is historyOfCarsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
