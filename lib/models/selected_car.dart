import 'package:hive_flutter/adapters.dart';

part 'selected_car.g.dart';

@HiveType(typeId: 2)
class selectedCars {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final image1;

  @HiveField(2)
  late String pickUpDate;

  @HiveField(3)
  late String dropOffDate;

  @HiveField(4)
  late String notes;

  @HiveField(5)
  late String currentKm;

  @HiveField(6)
  late String advanceAmount;

  @HiveField(7)
  final image2;

  @HiveField(8)
  late String customerName;
  @HiveField(9)
  late String mobileNumber;
  @HiveField(10)
  late String address;

  selectedCars({
    this.id,

    required this.image1,
    required this.pickUpDate,
    required this.dropOffDate,
    required this.notes,
    required this.currentKm,
    required this.advanceAmount,
    required this.image2,
    required this.customerName,
    required this.mobileNumber,
    required this.address
  });
}
