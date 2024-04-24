// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrental.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class carrentalAdapter extends TypeAdapter<CarRental> {
  @override
  final int typeId = 0;

  @override
  CarRental read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarRental(
      imagex: fields[0] as dynamic,
      car: fields[1] as String,
      brand: fields[2] as String,
      model: fields[3] as String,
      fuel: fields[4] as String,
      capacity: fields[5] as String,
      number: fields[6] as String,
      insurance: fields[7] as String,
      pollution: fields[8] as String,
      amount: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CarRental obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.imagex)
      ..writeByte(1)
      ..write(obj.car)
      ..writeByte(2)
      ..write(obj.brand)
      ..writeByte(3)
      ..write(obj.model)
      ..writeByte(4)
      ..write(obj.fuel)
      ..writeByte(5)
      ..write(obj.capacity)
      ..writeByte(6)
      ..write(obj.number)
      ..writeByte(7)
      ..write(obj.insurance)
      ..writeByte(8)
      ..write(obj.pollution)
      ..writeByte(9)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is carrentalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
