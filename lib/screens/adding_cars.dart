import 'dart:io';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/db_helper/carrental_service.dart';
import 'package:car_rental/screens/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class Adding_cars extends StatefulWidget {
  const Adding_cars({super.key});

  @override
  State<Adding_cars> createState() => _Adding_carsState();
}

class _Adding_carsState extends State<Adding_cars> {

  File? image25;
  String? imagepath;

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
            SizedBox(height: 20,),
            Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black12,
                        backgroundImage: image25 != null
                            ? FileImage(image25!)
                            : const AssetImage('')
                                as ImageProvider,
                        radius: 99),
                    Positioned(
                      bottom: 20,
                      right: 5,
                      child: IconButton(
                        onPressed: () {
                          // addphoto(context);
                          getimage(ImageSource.gallery);
                          // Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.add_a_photo_outlined,color: Colors.black,),
                        color: Color.fromARGB(255, 255, 255, 255),
                        iconSize: 30,
                      ),
                    ),
                  ],
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
               child:DropdownButtonFormField(items: [
            
                DropdownMenuItem(child: Text('Diesel',),
                value: -1,),
                DropdownMenuItem(child: Text('Petrol',),
                value: 1,),
                DropdownMenuItem(child: Text('Electric',),
                value: 2,),
                 DropdownMenuItem(child: Text('CNG',),
                value: 3,),
                
               ], onChanged: (v){},
                
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
                  if(value==null){
                    return 'Please select one item';
                  }else{
                    return null;
                  }
                },
                
               )
            ),
          
            // Seat capacity>>>>>>>>>>>>>>>>>>>
          
              SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 27,),
              child: 
              DropdownButtonFormField(items: [
                DropdownMenuItem(child: Text('4'),
                value: -1,),
                  DropdownMenuItem(child: Text('5'),
                value: 1,),
                  DropdownMenuItem(child: Text('6'),
                value:2,),
                 DropdownMenuItem(child: Text('7'),
                value:3,),
                 DropdownMenuItem(child: Text('8'),
                value:4,),
              ], onChanged: (v){},

               decoration: InputDecoration(
                    filled: true,
                  icon: Icon(Icons.airline_seat_recline_extra_sharp),
                  label: Text('Seat capacity :'),
                  hintText: 'Please enter the seating capacity',
                  border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25)
                  )
                ),
              
              validator: (value) {
                if(value==null){
                    return 'Please select one item';
                }else{
                  return null;
                }
              },)
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
                readOnly: true,
                decoration: InputDecoration(
                    filled: true,
                  icon: Icon(Icons.note),
                  label: Text('Insurance Upto :'),
                  hintText: 'Please enter the Insurance date',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25)
                  )
                ),
               
                 validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'Insurance is Emepty';
                  }else{
                    return null;
                  }
                  
                },
                onTap: (){
                    _selectedinsuranceDate();
                },
              ),
            ), 
            
            // Pollution>>>>>>>>>>>>>>>>>>>>>>

             SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 27,),
              child: TextFormField(
                controller: _pollutionController,
                readOnly: true,
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
                onTap: () {
                  
                  _selectedpollutionDate();
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

      if(_formkey.currentState!.validate()&& image25 != null){

 
         

final newcar = carrental(imagex: imagepath!, car: _nameController.text.trim(), 
brand: _brandController.text.trim(), model:_modelController.text.trim(), 
fuel: _fuelController.text.trim(), capacity: _seatController.text.trim(), number: _regnumberController.text.trim(),
 insurance: _insuranceController.text.trim(), pollution: _pollutionController.text.trim(), 
 amount: _amountController.text.trim());

            await _carrentalsevice.addCar(newcar);

             image25 = null;
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

    Future<void> getimage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    setState(() {
      image25 = File(image.path);
      imagepath = image.path.toString();
    });
  }

  Future<void> _selectedinsuranceDate()async {
    DateTime?pickeded = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2100),initialDate: DateTime.now());

    if(pickeded!= null){
      setState(() {
        _insuranceController.text = pickeded.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectedpollutionDate()async {
    DateTime?pickeded = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2100),initialDate: DateTime.now());

    if(pickeded!= null){
      setState(() {
       _pollutionController.text = pickeded.toString().split(" ")[0];
      });
    }
  }
}

