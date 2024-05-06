import 'dart:async';
import 'package:car_rental/models/carrental.dart';
import 'package:hive_flutter/adapters.dart';

class CarRentalService{




Box<CarRental>?_carServiceBox;

Future<void>openBox()async{

_carServiceBox = await Hive.openBox<CarRental>('cars');

}

Future<void>closeBox()async{
  await _carServiceBox!.close();
}

// add new car

Future<void>addCar(CarRental details)async{
    if(_carServiceBox==null){
      await openBox();

    }
    await _carServiceBox!.add(details);
}

// get details

  Future<List<CarRental>> getDetails() async {
    if (_carServiceBox == null) {
      await openBox();
    }

    return _carServiceBox!.values.toList();
  }


  // update


   Future<void> updateDetails(int index, CarRental details) async {
  
    if (_carServiceBox == null) {
      await openBox();
    }
    await _carServiceBox!.putAt(index, details);
  }

  // delete

Future<void> deleteDetails(int index) async {
    if (_carServiceBox == null) {
      await openBox();
    }

    await _carServiceBox!.deleteAt(index);
  }
}