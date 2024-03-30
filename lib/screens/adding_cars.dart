import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Adding_cars extends StatefulWidget {
  const Adding_cars({super.key});

  @override
  State<Adding_cars> createState() => _Adding_carsState();
}

class _Adding_carsState extends State<Adding_cars> {

  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _modelController = TextEditingController();
  final _fuelController = TextEditingController();
  final _seatController = TextEditingController();
  final _regnumberController = TextEditingController();
  final _insuranceController = TextEditingController();
  final _pollutionController = TextEditingController();
  final _amountController = TextEditingController();

  final _formkey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(80), child: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.lightGreen[400]),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 20,top: 10),
          child: ElevatedButton(onPressed: (){
            _formkey.currentState!.validate();
          }, child: Text('Submit',style: TextStyle(color:Colors.lightGreen[400],fontSize: 17 ),),style:ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)) ,),
        )],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
      )
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 30),
                  child: SingleChildScrollView(
                    child: Text('Adding new car details',style: TextStyle(fontSize: 20,color:Colors.grey[600]),),
                  ), 
                  
                ),

                SizedBox(width: 30,),
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
          
          // Name>>>>>>>>>>>>>>>>

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 27,),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    filled: true,
                  icon: Icon(Icons.directions_car_filled),
                  label: Text('Name :'),
                  hintText: 'Please enter the car Name',
                  border: OutlineInputBorder(
                    
                  )
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'Car Name is Empty ';
                  }else{
                    return null;
                  }
                },
              ),
            ),
          
          // Brand>>>>>>>>>>>>>>>>>>
          
              SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 27,),
              child: TextFormField(
                 controller: _brandController,
                decoration: InputDecoration(
                  icon: Icon(Icons.directions_car_filled),
                  label: Text('Brand :'),
                    filled: true,
                  hintText: 'Please enter the car Brand',
                  border: OutlineInputBorder(
                    
                  )
                ),
                validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'Car brand is Empty ';
                  }else{
                    return null;
                  }
                },
              ),
            ),
          
          // Model>>>>>>>>>>>>>>>>>>

              SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 27,),
              child: TextFormField(
                controller: _modelController,
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_month),
                  label: Text('Model :'),
                    filled: true,
                  hintText: 'Please enter the model year',
                  border: OutlineInputBorder(  
                  )
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'Car Model is Empty ';
                  }else{
                    return null;
                  }
                },
              ),
            ),  
            
            // Fuel>>>>>>>>>>>>>>>>>>>>>>
            
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 27,),
              child: TextFormField(
                controller: _fuelController,
                decoration: InputDecoration(
                    filled: true,
                  icon: Icon(Icons.local_gas_station_sharp),
                  label: Text('Fuel :'),
                  hintText: 'Please enter the fuel type',
                  border: OutlineInputBorder(
                    
                  )
                ),
                validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'Fuel type is Empty';
                  }else{
                    return null;
                  }
                },
              ),
            ),
          
            // Seat capacity>>>>>>>>>>>>>>>>>>>
          
              SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 27,),
              child: TextFormField(
                controller: _seatController,
                decoration: InputDecoration(
                    filled: true,
                  icon: Icon(Icons.airline_seat_recline_extra_sharp),
                  label: Text('Seat capacity :'),
                  hintText: 'Please enter the seating capacity',
                  border: OutlineInputBorder(
                    
                  )
                ),
                keyboardType: TextInputType.number,
                 validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'Seat capacity is Empty';
                  }else{
                    return null;
                  }
                },
              ),
            ),
          
            // Reg number>>>>>>>>>>>>>>>>>>>>>>>>>
          
              SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 27,),
              child: TextFormField(
                controller: _regnumberController,
                decoration: InputDecoration(
                    filled: true,
                  icon: Icon(Icons.onetwothree_rounded),
                  label: Text('Reg Number :'),
                  hintText: 'Please enter the car Reg Number',
                  border: OutlineInputBorder( 
                  ),
                ),
                keyboardType: TextInputType.number,
                 validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'Reg number is Empty';
                  }else{
                    return null;
                  }
                },
              ),
            ), 
            
            // Insurance>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

             SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 27,),
              child: TextFormField(
                controller: _insuranceController,
                decoration: InputDecoration(
                    filled: true,
                  icon: Icon(Icons.note),
                  label: Text('Insurance Upto :'),
                  hintText: 'Please enter the Insurance date',
                  border: OutlineInputBorder(
                    
                  )
                ),
                keyboardType: TextInputType.datetime,
                 validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'Insurance is Empty';
                  }else{
                    return null;
                  }
                },
              ),
            ), 
            
            // Pollution>>>>>>>>>>>>>>>>>>>>>>

             SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 27,),
              child: TextFormField(
                controller: _pollutionController,
                decoration: InputDecoration(
                    filled: true,
                  icon: Icon(Icons.note),
                  label: Text('Pollution Upto :'),
                  hintText: 'Please enter the pollution date',
                  border: OutlineInputBorder(
                    
                  )
                ),
                keyboardType: TextInputType.datetime,
                 validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'Pollution is Empty';
                  }else{
                    return null;
                  }
                },
              ),
            ),
              
              // Amount >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

              SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 27,),
              child: TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                    filled: true,
                  icon: Icon(Icons.currency_rupee_rounded),
                  label: Text('Amount of the Car :'),
                  hintText: 'Please enter amount of the car ',
                  border: OutlineInputBorder(
                    
                  )
                ),
                keyboardType: TextInputType.number,
                 validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'Car amount is Empty';
                  }else{
                    return null;
                  }
                },
              ),
            ),
          
          
            SizedBox(height: 50,)      
          
          
          ],
          ),
        ),
      ),
    );
  }
}