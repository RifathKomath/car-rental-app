import 'package:car_rental/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_Screen> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
                            Container(
                              width: 300,
                              child: Image.asset('assets/easy-rent-high-resolution-logo-transparent (1).png')
                              )
          ],
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => Login_Screen(),
      ),
    );
  }
}
