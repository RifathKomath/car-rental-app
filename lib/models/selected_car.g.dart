// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_car.dart';

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
    return selectedCars(
      id: fields[0] as int?,
      image1: fields[1] as dynamic,
      pickUpDate: fields[2] as String,
      dropOffDate: fields[3] as String,
      notes: fields[4] as String,
      currentKm: fields[5] as String,
      advanceAmount: fields[6] as String,
      image2: fields[7] as dynamic,
      customerName: fields[8] as String,
      mobileNumber: fields[9] as String,
      address: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, selectedCars obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image1)
      ..writeByte(2)
      ..write(obj.pickUpDate)
      ..writeByte(3)
      ..write(obj.dropOffDate)
      ..writeByte(4)
      ..write(obj.notes)
      ..writeByte(5)
      ..write(obj.currentKm)
      ..writeByte(6)
      ..write(obj.advanceAmount)
      ..writeByte(7)
      ..write(obj.image2)
      ..writeByte(8)
      ..write(obj.customerName)
      ..writeByte(9)
      ..write(obj.mobileNumber)
      ..writeByte(10)
      ..write(obj.address);
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
