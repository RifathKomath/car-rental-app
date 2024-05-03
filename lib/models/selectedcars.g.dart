// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_cars.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class selectedCarsAdapter extends TypeAdapter<selectedCars> {
  @override
  final int typeId = 2;

  @override
  selectedCars read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return selectedCars()
      ..pickUpDate = fields[1] as String
      ..dropOffDate = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, selectedCars obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.pickUpDate)
      ..writeByte(2)
      ..write(obj.dropOffDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is selectedCarsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
