import 'dart:io';
// import 'package:car_rental/db_helper/carrental_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/editing_page.dart';
import 'package:car_rental/screens/selected_car.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';



class Car_Details extends StatefulWidget {
  final CarRental carRental;


  const Car_Details({Key? key, required this.carRental}) : super(key: key);

  @override
  State<Car_Details> createState() => _Car_detailsState();
}

class _Car_detailsState extends State<Car_Details> {

  //  final CarRentalService _carRentalService = CarRentalService();
 
  final textStyle = TextStyle(fontSize: 16,fontWeight: FontWeight.bold);
  final subTextStyle = TextStyle(fontSize: 16);

  //  Future<void> _loadDetails ()async{
  //   await _carRentalService.deleteDetails(widget.index);
  
  //   setState(() {
      
  //   });
  // }

  // @override
  // void initState() {
  //   _loadDetails();
  //   super.initState();
  // }
  
     
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        title: Text('Car details',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey[900],
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
           
            child: Column(
             
              children: [
            
                SizedBox(height: 30,),
            
               SizedBox(
                              height: 150, 
                              width: 250,  
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(7),),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.file(
                                    File(widget.carRental.imagex),
                                     fit: BoxFit.cover,
                                  ),
                                ),
                              ),),
            
                      SizedBox(height: 20,),
            
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Column(
                        
                        children: [
                      
                          Row(
                            children: [
                              Text('Car name :',style: textStyle),
                              SizedBox(width: 8,),
                              Text('${widget.carRental.car}',style: subTextStyle,)
                            ],
                          ),
            
                          SizedBox(height: 13,),
                      
                          Row(
                            children: [
                              Text('Brand name :',style: textStyle),
                              SizedBox(width: 8,),
                              Text('${widget.carRental.brand}',style: subTextStyle)
                            ],
                          ),
            
                            SizedBox(height: 13,),
                      
                          Row(
                            children: [
                              Text('Model :',style: textStyle),
                              SizedBox(width: 8,),
                              Text('${widget.carRental.model}',style: subTextStyle,)
                            ],
                          ),
            
                            SizedBox(height: 13,),
                      
                          Row(
                            children: [
                              Text('Fuel type :',style: textStyle),
                              SizedBox(width: 8,),
                              Text('${widget.carRental.fuel}',style: subTextStyle,)
                            ],
                          ),
            
                            SizedBox(height: 13,),
                      
                          Row(
                            children: [
                              Text('Seat capacity :',style: textStyle),
                              SizedBox(width: 8,),
                              Text('${widget.carRental.seat}',style: subTextStyle,)
                            ],
                          ),
            
                            SizedBox(height: 13,),
                      
                          Row(
                            children: [
                              Text('Reg_Number :',style: textStyle),
                              SizedBox(width: 8,),
                              Text('${widget.carRental.number}',style: subTextStyle,)
                            ],
                          ),
            
                            SizedBox(height: 13,),
                      
                          Row(
                            children: [
                              Text('Insurance Upto :',style: textStyle),
                              SizedBox(width: 8,),
                              Text('${widget.carRental.insurance}',style: subTextStyle,)
                            ],
                          ),
            
                            SizedBox(height: 13,),
                      
                          Row(
                            children: [
                              Text('Pollution Upto :',style: textStyle),
                              SizedBox(width: 8,),
                              Text('${widget.carRental.pollution}',style: subTextStyle,)
                            ],
                          ),
            
                            SizedBox(height: 13,),
                      
                          Row(
                            children: [
                              Text('Amount of the car/month :',style: textStyle),
                              SizedBox(width: 8,),
                              Text('${widget.carRental.amount}',style: subTextStyle,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            
                
              
                SizedBox(height: 30,),
              // Buttons>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                 
                 Align(
                  alignment: Alignment.bottomCenter,
                   child: Container(
                      decoration: BoxDecoration(color: Colors.blueGrey[900],borderRadius: BorderRadius.circular(15)),
                      width: 320,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Row(
                          children: [
                            
                            ElevatedButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Editing_Page()));    
                            }, child: Text('Edit',style: TextStyle(color: Colors.white),),style: ButtonStyle(shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)),),
                        
                            SizedBox(width: 20,),
                        
                            ElevatedButton(onPressed: (){
                                    setState(() {
                                     showDialog(context: context, builder: (context){
                                 return AlertDialog(
                                   title: Row(
                                     children: [
                                       Text('Delete'),
                                        Text(' !',style: TextStyle(color: Colors.red),),
                                     ],
                                   ),
                                content: Text('Press OK for delete',style: TextStyle(fontSize: 15),),
                                    actions: [ 

                                       Row(
                                         children: [

                                          SizedBox(width: 60,),
                                           ElevatedButton( onPressed: () async {    
                                                   Navigator.pop(context);         
                                           }, child: Text('Cancel',style: TextStyle(color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.
                                          grey[900]),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),),

                               SizedBox(width: 10,),

                         ElevatedButton(
                    onPressed: () async {
                                                    //  await _carRentalService.deleteDetails(widget.index);
                                                                                        
                                                    // _loadDetails();
                
                    },
                    child: Text('OK',style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey[900]),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                       
                            ],
                             ), 
                                    
                            ],
                       
                            );
                           });
                        });
                        
                                  
                            }, child: Text('Delete',style: TextStyle(color: Colors.white),),style: ButtonStyle(shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)),),
                        
                            SizedBox(width: 20,),
                        
                             ElevatedButton(onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Selected_Car()));
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
      ),
    );
  } 
 
}