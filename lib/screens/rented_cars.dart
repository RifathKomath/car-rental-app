import 'package:car_rental/screens/search.dart';
import 'package:flutter/material.dart';

class Rented_cars extends StatelessWidget {
  const Rented_cars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        actions: [Padding(
          padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
          child:  ElevatedButton(onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Search_screen())));
          }, child: Icon(Icons.search,color: Colors.white,),style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),backgroundColor: MaterialStatePropertyAll(Colors.white24)),)
        )],
      ),


      body:  Center(child: Text('No rented cars',style:TextStyle(fontSize: 20) ,)),
    );
  }
}