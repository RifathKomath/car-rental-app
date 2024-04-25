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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/Animation - 1713871900626.json'),

          Container(
            width: 300,
            decoration: BoxDecoration(color: Colors.blueGrey[900],borderRadius: BorderRadius.circular(17),border: Border.all() ),
            child: Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text('EASY RENT',style: TextStyle(fontSize:50,fontStyle: FontStyle.italic,color: Colors.white),),
            ) ,
          )
          
        ],
      ),
    );
  }

  Future<void> gotoLogin () async{
      await Future.delayed(Duration(seconds: 3));
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>Login_Screen(),
  ),
  );
  }

}