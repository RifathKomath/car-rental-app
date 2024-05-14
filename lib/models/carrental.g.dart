// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrental.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarRentalAdapter extends TypeAdapter<CarRental> {
  @override
  final int typeId = 0;

  @override
  CarRental read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarRental(
      id: fields[0] as int?,
      imagex: fields[1] as dynamic,
      car: fields[2] as String,
      brand: fields[3] as String,
      model: fields[4] as String,
      fuel: fields[5] as String,
      seat: fields[6] as String,
      number: fields[7] as String,
      insurance: fields[8] as String,
      pollution: fields[9] as String,
      amount: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CarRental obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imagex)
      ..writeByte(2)
      ..write(obj.car)
      ..writeByte(3)
      ..write(obj.brand)
      ..writeByte(4)
      ..write(obj.model)
      ..writeByte(5)
      ..write(obj.fuel)
      ..writeByte(6)
      ..write(obj.seat)
      ..writeByte(7)
      ..write(obj.number)
      ..writeByte(8)
      ..write(obj.insurance)
      ..writeByte(9)
      ..write(obj.pollution)
      ..writeByte(10)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarRentalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
