import 'package:car_rental/db_helper/signup_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/models/signup.dart';
import 'package:car_rental/db_helper/carrental_service.dart';
import 'package:car_rental/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main()async{
await Hive.initFlutter();
Hive.registerAdapter(carrentalAdapter());
Hive.registerAdapter(signupAdapter());
 await CarrentalService().openBox();
 await SignupService().openBox();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>SignupService())
      ],
      child:
      MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        title: 'car_rental',
        debugShowCheckedModeBanner: false,
        home: Splash_Screen(),    
      ),
    );
  }
}