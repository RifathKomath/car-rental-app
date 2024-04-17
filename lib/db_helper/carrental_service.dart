import 'dart:async';
import 'package:car_rental/models/carrental.dart';
import 'package:hive_flutter/adapters.dart';

class carrentalservice{



Box<carrental>?_carserviceBox;

Future<void>openBox()async{

_carserviceBox = await Hive.openBox<carrental>('cars');

}

Future<void>closeBox()async{
  await _carserviceBox!.close();
}

// add new car

Future<void>addCar(carrental details)async{
    if(_carserviceBox==null){
      await openBox();

    }
    await _carserviceBox!.add(details);
}

// get details

  Future<List<carrental>> getdetails() async {
    if (_carserviceBox == null) {
      await openBox();
    }

    return _carserviceBox!.values.toList();
  }


  // update


  Future<void>updatedetails(int index, carrental details)async{

    if(_carserviceBox==null){
      await openBox();
    }
    await _carserviceBox!.putAt(index, details);
  }

  // delete

Future<void> deletedetails(int index) async {
    if (_carserviceBox == null) {
      await openBox();
    }

    await _carserviceBox!.deleteAt(index);
  }
}