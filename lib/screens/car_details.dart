import 'package:car_rental/screens/editing_page.dart';
import 'package:car_rental/screens/selected_car.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Car_Details extends StatefulWidget {
  const Car_Details({super.key});

  @override
  State<Car_Details> createState() => _Car_detailsState();
}

class _Car_detailsState extends State<Car_Details> {

  
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
           
            children: [

             

              
            
              SizedBox(height: 540,),
              
            // Buttons>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
               
               Align(
                alignment: Alignment.bottomCenter,
                 child: Container(
                    decoration: BoxDecoration(color: Colors.blueGrey[900],borderRadius: BorderRadius.circular(15)),
                    width: 320,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Row(
                        children: [
                          
                          ElevatedButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Editing_Page()));    
                          }, child: Text('Edit',style: TextStyle(color: Colors.white),),style: ButtonStyle(shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)),),
                      
                          SizedBox(width: 20,),
                      
                          ElevatedButton(onPressed: (){
                                
                          }, child: Text('Delete',style: TextStyle(color: Colors.white),),style: ButtonStyle(shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)),),
                      
                          SizedBox(width: 20,),
                      
                           ElevatedButton(onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Selected_Sar()));
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