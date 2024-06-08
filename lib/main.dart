import 'package:car_rental/db_helper/history_service.dart';
import 'package:car_rental/db_helper/selected_cars_service.dart';
import 'package:car_rental/db_helper/signup_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/models/history.dart';
import 'package:car_rental/models/selected_car.dart';
import 'package:car_rental/models/signup.dart';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CarRentalAdapter());
  Hive.registerAdapter(SignupAdapter());
  Hive.registerAdapter(selectedCarsAdapter());
  Hive.registerAdapter(historyOfCarsAdapter());
  await CarRentalService().openBox();
  await SignupService().openBox();
  await selectedCarService().openBox;
  await historyService().openBox();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => SignupService())],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        title: 'car_rental',
        debugShowCheckedModeBanner: false,
        home: Splash_Screen(),
      ),
    );
  }
}
