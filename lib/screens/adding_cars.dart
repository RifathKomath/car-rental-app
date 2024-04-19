import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/db_helper/carrental_service.dart';
import 'package:car_rental/screens/bottom_navigation.dart';
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

final carrentalservice _carrentalsevice = carrentalservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.blueGrey[900], 
        automaticallyImplyLeading: false,    
        iconTheme: IconThemeData(color: Colors.white),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
          child: ElevatedButton(onPressed: (){

            if (_nameController.text.isNotEmpty ||
                            _brandController.text.isNotEmpty ||
                            _modelController.text.isNotEmpty ||
                            _fuelController.text.isNotEmpty||
                            _seatController.text.isNotEmpty||
                            _regnumberController.text.isNotEmpty||
                            _insuranceController.text.isNotEmpty||
                            _pollutionController.text.isNotEmpty||
                            _amountController.text.isNotEmpty) {
                          
                          validator();

                        } else {

                          _formkey.currentState!.validate();
                           
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor:Colors.black ,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text('Please fill the fields')),);
                        }

          }, child: Text('Save',style: TextStyle(color:Colors.white,fontSize: 17 ),),style:ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)) ,),
        )],
      ),
   
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
          children: [
              
          // Name>>>>>>>>>>>>>>>>

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 27,),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    filled: true,
                  icon: Icon(Icons.directions_car_filled),
                  label: Text(' Car name :'),
                  hintText: 'Please enter the car Name',
                  border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(25)
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
                     borderRadius: BorderRadius.circular(25)
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
                  borderRadius: BorderRadius.circular(25)
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
               borderRadius: BorderRadius.circular(25)
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
              borderRadius: BorderRadius.circular(25)
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
                borderRadius: BorderRadius.circular(25)
                  ),
                ),
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
                  borderRadius: BorderRadius.circular(25)
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
                    borderRadius: BorderRadius.circular(25)
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
                    borderRadius: BorderRadius.circular(25)
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
    validator()async{

      if(_formkey.currentState!.validate()){

final newcar = carrental(imagex: null, car: _nameController.text, brand: _brandController.text, model:_modelController.text, fuel: _fuelController.text, capacity: _seatController.text, number: _regnumberController.text, insurance: _insuranceController.text, pollution: _pollutionController.text, amount: _amountController.text);

            await _carrentalsevice.addCar(newcar);

            _nameController.clear();
            _brandController.clear();
            _modelController.clear();
            _fuelController.clear();
            _seatController.clear();
            _regnumberController.clear();
            _insuranceController.clear();
            _pollutionController.clear();
            _amountController.clear();

            

             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Bottom_navigation()));

      }
    }
}

