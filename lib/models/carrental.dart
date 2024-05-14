import 'package:hive_flutter/adapters.dart';

part 'carrental.g.dart';

@HiveType(typeId: 0)
class CarRental {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final imagex;

  @HiveField(2)
  late String car;

  @HiveField(3)
  late String brand;

  @HiveField(4)
  late String model;

  @HiveField(5)
  late String fuel;

  @HiveField(6)
  late String seat;

  @HiveField(7)
  late String number;

  @HiveField(8)
  late String insurance;

  @HiveField(9)
  late String pollution;

  @HiveField(10)
  late String amount;

  CarRental({
    this.id,
    required this.imagex,
    required this.car,
    required this.brand,
    required this.model,
    required this.fuel,
    required this.seat,
    required this.number,
    required this.insurance,
    required this.pollution,
    required this.amount,
  });
}
