import 'package:car_rental/screens/bottom_navigation.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(const Myapp());

}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      title: 'car_rental',
      debugShowCheckedModeBanner: false,
      home: Bottom_navigation(),    
    );
  }
}