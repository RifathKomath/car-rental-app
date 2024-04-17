import 'package:car_rental/screens/Editing_page.dart';
import 'package:car_rental/screens/selected_car.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Car_details extends StatelessWidget {
  const Car_details({super.key});

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