import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Car_details extends StatelessWidget {
  const Car_details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.lightGreen[400]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20),
                child: Text('Selected vehicle',style: TextStyle(fontSize: 20,color:Colors.grey[600]),), 
              ),
               SizedBox(width: 100,),
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


              SizedBox(height: 450,),
            

            // Buttons>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

               Padding(
                 padding: const EdgeInsets.only(left: 1),
                 child: Container(
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(15)),
                    width: 320,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Row(
                        children: [
                          ElevatedButton(onPressed: (){
                                
                          }, child: Text('Edit',style: TextStyle(color: Colors.lightGreen[400]),),style: ButtonStyle(shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)),),
                      
                          SizedBox(width: 20,),
                      
                          ElevatedButton(onPressed: (){
                                
                          }, child: Text('Delete',style: TextStyle(color: Colors.lightGreen[400]),),style: ButtonStyle(shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)),),
                      
                          SizedBox(width: 20,),
                      
                           ElevatedButton(onPressed: (){
                                
                          }, child: Text('Select',style: TextStyle(color: Colors.lightGreen[400]),),style: ButtonStyle(shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)),),
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