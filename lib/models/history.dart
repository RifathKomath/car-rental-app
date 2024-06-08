import 'package:hive_flutter/hive_flutter.dart';

part 'history.g.dart';

@HiveType(typeId: 3)
class historyOfCars{

@HiveField(0)
int? id;

@HiveField(1)
late String history;

historyOfCars({
  this.id,
  required this.history
});

  void clear() {}

  void addAll(Iterable<historyOfCars> values) {}
}