import 'package:hive/hive.dart';

part 'selectedcars.g.dart';

@HiveType(typeId: 2)
class selectedCars extends HiveObject{

@HiveType(typeId: 0)
late String image25;  

@HiveField(1)
late String pickUpDate;

@HiveField(2)
late String dropOffDate;

@HiveType(typeId: 3)
late String notes;

@HiveType(typeId: 4)
late String currentkm;

@HiveType(typeId: 5)
late String advanceAmount;

@HiveType(typeId: 6)
late String image24;

@HiveType(typeId: 7)
late String customerName;

@HiveType(typeId: 8)
late String address;





}