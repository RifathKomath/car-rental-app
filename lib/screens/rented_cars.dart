import 'package:flutter/material.dart';

class Rented_cars extends StatelessWidget {
  const Rented_cars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(80), child: AppBar(
        backgroundColor: Colors.black,
         actions: [Padding(
          padding: const EdgeInsets.only(right: 20,top: 10),
          child: ElevatedButton(onPressed: (){
          }, child: Text('History of Cars',style: TextStyle(color:Colors.lightGreen[400],fontSize: 17 ),),style:ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)) ,),
        )],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
        ),
      )),
      body:  SingleChildScrollView(
       child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20),
                child: Text('Rented Cars',style: TextStyle(fontSize: 20,color:Colors.grey[600]),), 
              ),
               SizedBox(width: 130,),
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