import 'package:car_rental/screens/editing_page.dart';
import 'package:car_rental/screens/selected_car.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Car_details extends StatefulWidget {
  const Car_details({super.key});

  @override
  State<Car_details> createState() => _Car_detailsState();
}

class _Car_detailsState extends State<Car_details> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

             

              SizedBox(height: 450,),
            

            // Buttons>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

               Padding(
                 padding: const EdgeInsets.only(left: 1),
                 child: Container(
                    decoration: BoxDecoration(color: Colors.blueGrey[900],borderRadius: BorderRadius.circular(15)),
                    width: 320,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Row(
                        children: [
                          ElevatedButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Editing_page()));    
                          }, child: Text('Edit',style: TextStyle(color: Colors.white),),style: ButtonStyle(shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)),),
                      
                          SizedBox(width: 20,),
                      
                          ElevatedButton(onPressed: (){
                                
                          }, child: Text('Delete',style: TextStyle(color: Colors.white),),style: ButtonStyle(shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)),),
                      
                          SizedBox(width: 20,),
                      
                           ElevatedButton(onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Selected_car()));
                          }, child: Text('Select',style: TextStyle(color: Colors.white),),style: ButtonStyle(shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)),),
                        ],
                        
                      ),
                    ),
                  ),
               )
            
            ],
          ),
        ),
      ),
    );
  }
}