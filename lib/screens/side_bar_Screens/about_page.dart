import 'package:flutter/material.dart';

class About_Page extends StatelessWidget {
  const About_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey[900],
        title: Text('About Us',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),

    body: null,
    );
  }
}