import 'package:flutter/material.dart';

class History_Page extends StatelessWidget {
  const History_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'History of cars',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: null,
    );
  }
}
