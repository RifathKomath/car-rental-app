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
    List<String>? image1;

   @HiveField(13)
   String? pickUpDate;

  @HiveField(14)
   String? dropOffDate;

   @HiveField(15)
   String?  notes;

  @HiveField(16)
   String? currentKm;

    @HiveField(17)
   String?  advanceAmount;

  @HiveField(18)
   List<String>? image2;

    @HiveField(19)
   String?  customerName;

  @HiveField(20)
   String? mobileNumber;

    @HiveField(21)
   String? address;

   @HiveField(22)
   String?  history;



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
    this.image1,
    this.dropOffDate,
    this.pickUpDate,
    this.notes,
    this.currentKm,
    this.advanceAmount,
    this.image2,
    this.customerName,
    this.mobileNumber,
    this.address,
    this.history
  });

  double calculateBalance() {
    double amountValue = double.tryParse(amount) ?? 0.0;
    double advanceValue = double.tryParse(advanceAmount ?? '0.0') ?? 0.0;
    return amountValue - advanceValue;
  }
}
