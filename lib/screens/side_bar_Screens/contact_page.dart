import 'package:flutter/material.dart';

class Contact_Page extends StatelessWidget {
  const Contact_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey[900],
        title: Text('Contact Us',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),

    body: null,
    );
  }
}