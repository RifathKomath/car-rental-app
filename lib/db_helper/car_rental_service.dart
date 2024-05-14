import 'dart:async';
import 'package:car_rental/models/carrental.dart';
import 'package:hive_flutter/adapters.dart';

class CarRentalService {
  static Box<CarRental>? carServiceBox;

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
  }

// get details

  Future<List<CarRental>> getDetails() async {
    if (carServiceBox == null) {
      await openBox();
    }

    return carServiceBox!.values.toList();
  }

// update
  Future<void> editDetails(CarRental value) async {
    print('reached edit');
    // final _carServiceBox = await Hive.openBox<CarRental>('cars');
    openBox();
    carServiceBox?.put(value.id, value);
    var data = carServiceBox?.get(value.id);

    print(data?.car);
    getDetails();
  }

  // delete

  Future<void> deleteDetails(int index) async {
    if (carServiceBox == null) {
      await openBox();
    }

    await carServiceBox!.deleteAt(index);
  }


}
