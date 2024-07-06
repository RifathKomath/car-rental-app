import 'package:car_rental/models/carrental.dart';
import 'package:flutter/material.dart';

class RevenuePageDetail extends StatefulWidget {
  CarRental carRental;
   RevenuePageDetail({super.key,required this.carRental});

  @override
  State<RevenuePageDetail> createState() => _RevenuePageDetailState();
}

class _RevenuePageDetailState extends State<RevenuePageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Revenue of rented car',style: TextStyle(color: Colors.white),),
          centerTitle: true,
      ),

    );
  }
}