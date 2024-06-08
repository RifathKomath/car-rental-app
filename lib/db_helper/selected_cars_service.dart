

import 'package:car_rental/models/selected_car.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class selectedCarService {
  static Box<selectedCars>? selectedCarBox;

  static ValueNotifier<List<selectedCars>> rentedCarListNotifier =
      ValueNotifier<List<selectedCars>>([]);

  // ValueNotifier<List<CarRental>> tripslists = ValueNotifier([]);

  Future<void> openBox() async {
  try {
     selectedCarBox = await Hive.openBox<selectedCars>('selectedCar');
  } catch (e) {
    print('error from open box=$e');
  }
   
  }

  Future<void> closeBox() async {
    await selectedCarBox!.close();
  }

// add new car
  Future<void> addDetails(selectedCars details) async {
    if (selectedCarBox == null) {
      await openBox();
    }try {
          details.id = await selectedCarBox!.add(details);
    selectedCarBox?.put(details.id, details);
    // refreshCarList(); // Refresh the list after adding a new car
    updateValues();
    print ('selectd car detail added');
      
    } catch (e) {
      
      print('Error $e');
    }

  }

  // get details
  Future<List<selectedCars>> getDetails() async {
    if (selectedCarBox == null) {
      await openBox();
    }
    return selectedCarBox!.values.toList();
  }

  // Method to refresh the car list
  // Future<void> refreshCarList() async {
  //   carListNotifier.value = await getDetails();
  // }

  Future<void> updateValues() async {
    if (selectedCarBox == null) {
      openBox();
    }
    rentedCarListNotifier.value.clear();
    rentedCarListNotifier.value.addAll(selectedCarBox!.values);
    rentedCarListNotifier.notifyListeners();
  }
}
