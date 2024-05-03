import 'package:car_rental/models/selected_cars.dart';
import 'package:hive_flutter/adapters.dart';

class SelectedCarService {


Box<selectedCars>?_selectedCarBox;

Future<void>openBox()async{
  _selectedCarBox = await Hive.openBox<selectedCars>('car_Details');
}
Future<void>closeBox()async{
 await _selectedCarBox!.close();
}


// add cardetails car

Future<void>addRentedCar(selectedCars details)async{
    if(_selectedCarBox==null){
      await openBox();

    }
    await _selectedCarBox!.add(details);
}

// get details

  Future<List<selectedCars>> getRentalDetails() async {
    if (_selectedCarBox == null) {
      await openBox();
    }

    return _selectedCarBox!.values.toList();
  }


  // update


  Future<void>updateRentaldetails(int index, selectedCars details)async{

    if(_selectedCarBox==null){
      await openBox();
    }
    await _selectedCarBox!.putAt(index, details);
  }

  // delete

Future<void> deleteRentalDetails(int index) async {
    if (_selectedCarBox == null) {
      await openBox();
    }

    await _selectedCarBox!.deleteAt(index);
  }

}