import 'package:car_rental/screens/rented_cars_details.dart';
import 'package:car_rental/screens/selected_car.dart';
import 'package:flutter/material.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(135), child: AppBar(
        backgroundColor: Colors.black,
        actions: [SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Rented_car_details())));
            }, icon: Icon(Icons.notifications,color: Colors.lightGreen[400],size: 30,)),
          ),
        )],
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Selected_car()));
          }, icon: Icon(Icons.sort,color: Colors.lightGreen[400],size: 40,)),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
        bottom: PreferredSize(preferredSize: Size.fromHeight(140), child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(height: 45,width: 250,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Search',
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: Icon(Icons.search, color: Colors.white),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                )),
              ),
              SizedBox(width: 15,),
              ElevatedButton(onPressed: (){}, child: Icon(Icons.filter_alt_outlined,color: Colors.lightGreen[400],),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white24),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))))
            ],
          ),
        ),
      ),
      )
    ),
    body:
     SingleChildScrollView(
       child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20),
                child: Text('Available Cars',style: TextStyle(fontSize: 20,color:Colors.grey[600]),), 
              ),
               SizedBox(width: 120,),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20),
                  child: Icon(Icons.directions_car_outlined,color: Colors.lightGreen[400],size: 40,),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Divider(),
          ),   
        ],
           ),
     ),
    );
  }
}