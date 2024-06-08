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

  @HiveField(11)
   bool status;

   @HiveField(12)
   String? pickUpDate;

  @HiveField(13)
   String? dropOffDate;

   @HiveField(14)
   String?  notes;

  @HiveField(15)
   String? currentKm;

    @HiveField(16)
   String?  advanceAmount;

  @HiveField(17)
   String? image2;

    @HiveField(18)
   String?  customerName;

  @HiveField(19)
   String? mobileNumber;
    @HiveField(20)
   String? address;



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
    this.status=false,
    this.dropOffDate,
    this.pickUpDate,
    this.notes,
    this.currentKm,
    this.advanceAmount,
    this.image2,
    this.customerName,
    this.mobileNumber,
    this.address
  });
}
