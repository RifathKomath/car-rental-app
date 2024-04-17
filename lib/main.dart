import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/login_page.dart';
import 'package:car_rental/db_helper/carrental_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main()async{
await Hive.initFlutter();
Hive.registerAdapter(carrentalAdapter());
 await carrentalservice().openBox();
  runApp(const Myapp());

}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      title: 'car_rental',
      debugShowCheckedModeBanner: false,
      home: Login_screen(),    
    );
  }
}