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
  String? notes;

  @HiveField(16)
  String? currentKm;

  @HiveField(17)
  String? advanceAmount;

  @HiveField(18)
  final image2;

  @HiveField(19)
  String? customerName;

  @HiveField(20)
  String? mobileNumber;

  @HiveField(21)
  String? address;

  @HiveField(22)
  String? history;

  @HiveField(23)
  String? drivenKm;

  @HiveField(24)
  bool paid;

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
    this.status = false,
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
    this.history,
    this.drivenKm,
    this.paid = false,
  });

  double _parseDouble(String? value, [double defaultValue = 0.0]) {
    return double.tryParse(value ?? '') ?? defaultValue;
  }

  double calculateAdditionalKm() {
    double currentKmValue = _parseDouble(currentKm);
    double drivenKmValue = _parseDouble(drivenKm);
    double distance = drivenKmValue - currentKmValue;
    return (distance > 800) ? distance - 800 : 0.0;
  }

  double calculateExtraRate() {
    double additionalKm = calculateAdditionalKm();
    return (additionalKm > 0) ? (additionalKm / 10).ceil() * 100 : 0.0;
  }

  double calculateTotalRate() {
    double amountValue = _parseDouble(amount);
    double advanceValue = _parseDouble(advanceAmount);
    double difference = amountValue - advanceValue;
    double extraRate = calculateExtraRate();
    
    return difference + extraRate;
  }
}
