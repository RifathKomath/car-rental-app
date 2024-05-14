import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Contact_Page extends StatelessWidget {
  const Contact_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Lottie.asset('assets/Animation - 1713868836219.json'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Feel free to contact Us',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Company name : EASYRENT',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'E-mail : easyrent@gmail.com',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
