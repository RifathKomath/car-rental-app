import 'package:car_rental/models/history.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<historyOfCars?>historyCarNotifier= ValueNotifier(null);

class historyService{
  Box<historyOfCars>?historyBox;
  
  Future<void>openBox()async{
    historyBox= await Hive.openBox('history');
  }

 Future<List<historyOfCars>> getDetails() async {
    if (historyBox == null) {
      await openBox();
    }
    return historyBox!.values.toList();
  }

   Future<void> addHistory(historyOfCars details) async {
    if (historyBox== null) {
      await openBox();
    }
    details.id = await historyBox!.add(details);
    historyBox?.put(details.id, details);
    updateValues();
  }
  Future<void> updateValues() async {
    if (historyBox == null) {
      openBox();
    }
    historyCarNotifier.value?.clear();
    historyCarNotifier.value?.addAll(historyBox!.values);
    historyCarNotifier.notifyListeners();
  }

}