import 'package:flutter/material.dart';

class RevenuePage extends StatelessWidget {
  const RevenuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'Revenue',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: null,
    );
  }
}
