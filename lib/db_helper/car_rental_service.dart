import 'dart:async';
import 'package:car_rental/models/carrental.dart';
import 'package:flutter/foundation.dart'; // Import for ValueNotifier
import 'package:hive_flutter/adapters.dart';

class CarRentalService {
  static Box<CarRental>? carServiceBox;

 static ValueNotifier<List<CarRental>> carListNotifier =
      ValueNotifier<List<CarRental>>([]);

  // ValueNotifier<List<CarRental>> tripslists = ValueNotifier([]);

  Future<void> openBox() async {
    carServiceBox = await Hive.openBox<CarRental>('cars');
  }

  Future<void> closeBox() async {
    await carServiceBox!.close();
  }

  // add new car
  Future<void> addCar(CarRental details) async {
    if (carServiceBox == null) {
      await openBox();
    }
    details.id = await carServiceBox!.add(details);
    carServiceBox?.put(details.id, details);
    // refreshCarList(); // Refresh the list after adding a new car
    updateValues();
  }

  // get details
  Future<List<CarRental>> getDetails() async {
    if (carServiceBox == null) {
      await openBox();
    }
    return carServiceBox!.values.toList();
  }

Future<void> deleteDetails(int index) async {
    if (carServiceBox == null) {
      await openBox();
    }

    await carServiceBox!.deleteAt(index);
  }


  // update
  Future<void> editDetails(CarRental value) async {
    if (carServiceBox == null) {
      await openBox();
    }
    carServiceBox?.put(value.id, value);
    var data = carServiceBox?.get(value.id);
    print(data?.car);
     // refreshCarList();
    updateValues();
  }


  // Method to refresh the car list
  // Future<void> refreshCarList() async {
  //   carListNotifier.value = await getDetails();
  // }

  Future<void> updateValues() async {
    if (carServiceBox == null) {
      openBox();
    }
    carListNotifier.value.clear();
    carListNotifier.value.addAll(carServiceBox!.values);
    carListNotifier.notifyListeners();
  }

//   Future<void> deleteCar(int id) async {
//   final userBox = await Hive.openBox<CarRental>('cars');
//   print(id);
//   userBox.delete(id);
//   print(userBox.values.length);
//   updateValues();
// }
}
