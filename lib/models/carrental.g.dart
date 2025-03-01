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
      status: fields[11] as bool,
      image1: (fields[12] as List?)?.cast<String>(),
      dropOffDate: fields[14] as String?,
      pickUpDate: fields[13] as String?,
      notes: fields[15] as String?,
      currentKm: fields[16] as String?,
      advanceAmount: fields[17] as String?,
      image2: fields[18] as dynamic,
      customerName: fields[19] as String?,
      mobileNumber: fields[20] as String?,
      address: fields[21] as String?,
      history: fields[22] as String?,
      drivenKm: fields[23] as String?,
      
    );
  }

  @override
  void write(BinaryWriter writer, CarRental obj) {
    writer
      ..writeByte(24)
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
      ..write(obj.amount)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.image1)
      ..writeByte(13)
      ..write(obj.pickUpDate)
      ..writeByte(14)
      ..write(obj.dropOffDate)
      ..writeByte(15)
      ..write(obj.notes)
      ..writeByte(16)
      ..write(obj.currentKm)
      ..writeByte(17)
      ..write(obj.advanceAmount)
      ..writeByte(18)
      ..write(obj.image2)
      ..writeByte(19)
      ..write(obj.customerName)
      ..writeByte(20)
      ..write(obj.mobileNumber)
      ..writeByte(21)
      ..write(obj.address)
      ..writeByte(22)
      ..write(obj.history)
      ..writeByte(23)
      ..write(obj.drivenKm);
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
