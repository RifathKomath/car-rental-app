import 'package:flutter/material.dart';

class RevenuePageDetail extends StatefulWidget {
  const RevenuePageDetail({super.key});

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
          title: Text('Revenue of the car',style: TextStyle(color: Colors.white),),
          centerTitle: true,
      ),
    );
  }
}