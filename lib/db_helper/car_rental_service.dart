import 'dart:async';
import 'package:car_rental/models/carrental.dart';
import 'package:flutter/foundation.dart'; // Import for ValueNotifier
import 'package:hive_flutter/adapters.dart';

class CarRentalService {
  static Box<CarRental>? carServiceBox;

  static ValueNotifier<List<CarRental>> carListNotifier =
      ValueNotifier<List<CarRental>>([]);

  Future<void> openBox() async {
    carServiceBox = await Hive.openBox<CarRental>('cars');
  }

  Future<void> closeBox() async {
    await carServiceBox!.close();
  }

  // Add new car
  Future<void> addCar(CarRental details) async {
    if (carServiceBox == null) {
      await openBox();
    }
    details.id = await carServiceBox!.add(details);
    carServiceBox?.put(details.id, details);
    await updateValues();
  }

  // Get details
  Future<List<CarRental>> getDetails() async {
    if (carServiceBox == null) {
      await openBox();
    }
    return carServiceBox!.values.toList();
  }

  // Delete car by ID
  Future<void> deleteDetails(int? id) async {
    if (carServiceBox == null) {
      await openBox();
    }
    await carServiceBox!.delete(id);
    await updateValues();
  }

  // Update car details
  Future<void> editDetails(CarRental value) async {
    if (carServiceBox == null) {
      await openBox();
    }
    carServiceBox?.put(value.id, value);
    await updateValues();
  }

  // Update the ValueNotifier with current values
  Future<void> updateValues() async {
    if (carServiceBox == null) {
      await openBox();
    }
    carListNotifier.value = carServiceBox!.values.toList();
    carListNotifier.notifyListeners();
  }

  // Search car by name
  Future<void> searchCar(String value) async {
    if (carServiceBox == null) {
      await openBox();
    }
    final searchResults = carServiceBox!.values
        .where((element) =>
            element.car.toLowerCase().contains(value.toLowerCase()))
        .toList();
    carListNotifier.value = searchResults;
    carListNotifier.notifyListeners();
  }
}
