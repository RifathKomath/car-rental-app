

import 'package:hive_flutter/adapters.dart';

part 'carrental.g.dart';

@HiveType(typeId: 0)
class carrental{

  @HiveField(0)
  final imagex;

  @HiveField(1)
  late String car;

  @HiveField(2)
  late String brand;

  @HiveField(3)
  late String model;

  @HiveField(4)
  late String fuel;

  @HiveField(5)
  late String capacity;

  @HiveField(6)
  late String number;

  @HiveField(7)
  late String insurance;

  @HiveField(8)
  late String pollution;

  @HiveField(9)
  late String amount;


  
  carrental({
    required this.imagex,
    required this.car,
    required this.brand,
    required this.model,
    required this.fuel,
    required this.capacity,
    required this.number,
    required this.insurance,
    required this.pollution,
    required this.amount,

  });

}

