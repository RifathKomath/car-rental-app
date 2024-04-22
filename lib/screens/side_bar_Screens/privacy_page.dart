import 'package:flutter/material.dart';

class Privacy_Page extends StatelessWidget {
  const Privacy_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey[900],
        title: Text('Privacy Policy',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        
      ),

    body: null,
    );
  }
}