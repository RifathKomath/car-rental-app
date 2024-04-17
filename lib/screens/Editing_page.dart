import 'package:flutter/material.dart';

class Editing_page extends StatefulWidget {
  const Editing_page({super.key});

  @override
  State<Editing_page> createState() => _Editing_pageState();
}

class _Editing_pageState extends State<Editing_page> {

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
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            content: Text('Details successfully edited')));
            _formkey.currentState!.validate();
          }, child: Text('Save',style: TextStyle(color:Colors.white,fontSize: 17 ),),style:ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.white24)) ,),
        )],
      ),
      body:  SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
          children: [
            
          // Name>>>>>>>>>>>>>>>>

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 27,),
              child: TextFormField(
                controller: _EditnameController,
                decoration: InputDecoration(
                    filled: true,
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
                controller: _EditmodelController,
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
                controller: _EditfuelController,
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
                controller: _EditseatController,
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
                controller: _EditregnumberController,
                decoration: InputDecoration(
                    filled: true,
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
                controller: _EditpollutionController,
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
                controller: _EditamountController,
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
          
          
            SizedBox(height: 30,),    
                    
          ],
          ),
        ),
      ),
    );
  }
}