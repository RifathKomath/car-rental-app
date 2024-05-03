import 'dart:io';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/car_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Editing_Page extends StatefulWidget {
  const Editing_Page({super.key});

  @override
  State<Editing_Page> createState() => _Editing_pageState();
}

class _Editing_pageState extends State<Editing_Page> {

  int selectedIndex = -1; // Initialize with a default value, -1 indicates no item selected initially

  final CarRentalService _carRentalSevice = CarRentalService();

  File? image25;
  String? imagepath;

final _EditnameController = TextEditingController();
  final _EditbrandController = TextEditingController();
  final _EditmodelController = TextEditingController();
  final _EditfuelController = TextEditingController();
  final _EditseatController = TextEditingController();
  final _EditregnumberController = TextEditingController();
  final _EditinsuranceController = TextEditingController();
  final _EditpollutionController = TextEditingController();
  final _EditamountController = TextEditingController();

  final _formkey =GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        iconTheme: IconThemeData(color: Colors.white),
           actions: [Padding(
          padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
          child: ElevatedButton(onPressed: (){

            if (_EditnameController.text.isNotEmpty ||
                            _EditbrandController.text.isNotEmpty ||
                            _EditbrandController.text.isNotEmpty ||
                            _EditfuelController.text.isNotEmpty||
                           _EditseatController.text.isNotEmpty||
                            _EditregnumberController.text.isNotEmpty||
                            _EditinsuranceController.text.isNotEmpty||
                            _EditpollutionController.text.isNotEmpty||
                            _EditamountController.text.isNotEmpty) {
                          
                          validator();

                        } else {

                          // _formkey.currentState!.validate() && image25 !=null;
                           
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor:Colors.black ,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text('Please fill the fields')),);
                        }

          }, child: Text('Save',style: TextStyle(color:Colors.white,fontSize: 17 ),),style:ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)) ,),
      )]),
      body:  SingleChildScrollView(
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
                controller: _EditnameController,
                decoration: InputDecoration(
                    // filled: true,
                  icon: Icon(Icons.directions_car_filled),
                  label: Text('Car name :'),
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
                 controller: _EditbrandController,
                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[A-Z].[a-z]'))],
                decoration: InputDecoration(
                  icon: Icon(Icons.directions_car_filled),
                  label: Text('Brand :'),
                    // filled: true,
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
                controller: _EditmodelController,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_month),
                  label: Text('Model :'),
                    // filled: true,
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
                controller: _EditfuelController,
                decoration: InputDecoration(
                    // filled: true,
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
                controller: _EditseatController,
                decoration: InputDecoration(
                    // filled: true,
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
                controller: _EditregnumberController,
                decoration: InputDecoration(
                    // filled: true,
                  icon: Icon(Icons.onetwothree_rounded),
                  label: Text('Reg Number :'),
                  hintText: 'Please enter the car Reg Number',
                  border: OutlineInputBorder( 
                    borderRadius: BorderRadius.circular(25)
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
                controller: _EditinsuranceController,
                decoration: InputDecoration(
                    // filled: true,
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
                controller: _EditpollutionController,
                decoration: InputDecoration(
                    // filled: true,
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
                controller: _EditamountController,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                decoration: InputDecoration(
                    // filled: true,
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
          
          
            SizedBox(height: 30,),    
                    
          ],
          ),
        ),
      ),
    );
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
      Future<void> validator() async {
  if (_formkey.currentState!.validate() && image25 != null) {
    final car = _EditnameController.text.trim();
    final brand = _EditbrandController.text.trim();
    final model = _EditmodelController.text.trim().toString();
    final fuel = _EditfuelController.text.trim();
    final seat = _EditseatController.text.trim().toString();
    final reg_num =
        _EditregnumberController.text.trim().toUpperCase().toString();
    final insurance = _EditinsuranceController.text.trim();
    final pollution = _EditpollutionController.text.trim();
    final amount = _EditamountController.text.trim().toString();

    final newCar = CarRental(
      imagex: imagepath!,
      car: car,
      brand: brand,
      model: model,
      fuel: fuel,
      seat: seat,
      number: reg_num,
      insurance: insurance,
      pollution: pollution,
      amount: amount,
    );

    if (selectedIndex != -1) {
      // If an item is selected, update its details
      await _carRentalSevice.updatedetails(selectedIndex, newCar);
    } else {
      // Handle the case where no item is selected
      print("No item selected to update");
    }

    // Resetting values and navigating
    image25 = null;
    _EditnameController.clear();
    _EditbrandController.clear();
    _EditmodelController.clear();
    _EditfuelController.clear();
    _EditseatController.clear();
    _EditregnumberController.clear();
    _EditinsuranceController.clear();
    _EditpollutionController.clear();
    _EditamountController.clear();

    Navigator.of(context).push(
  MaterialPageRoute(builder: (context) => Car_Details(carRental: newCar,)),
);
}
else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text('Please fill the fields'),
      ),
    );
  }
}
void handleItemSelection(int index) {
  setState(() {
    selectedIndex = index; // Update selectedIndex when an item is selected
  });
}
}