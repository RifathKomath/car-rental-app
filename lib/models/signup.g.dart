// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignupAdapter extends TypeAdapter<Signup> {
  @override
  final int typeId = 1;

  @override
  Signup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Signup(
      username: fields[0] as String,
      password: fields[1] as String,
      confirmpassword: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Signup obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.confirmpassword);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
