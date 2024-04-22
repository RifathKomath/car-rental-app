import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Selected_car extends StatefulWidget {
  const Selected_car({super.key});

  @override
  State<Selected_car> createState() => _Selected_carState();
}

class _Selected_carState extends State<Selected_car> {

  final _formkey=GlobalKey<FormState>();

  final _pickupdate = TextEditingController();
  final _dropoffdate = TextEditingController();
  final _notes = TextEditingController();
  final _totalamount = TextEditingController();
  final _advanceamount = TextEditingController();
  final _customername = TextEditingController();
  final _mobilenumber = TextEditingController();
  final _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child:Scaffold(appBar:AppBar(
     backgroundColor: Colors.blueGrey[900],
             iconTheme: IconThemeData(color: Colors.white),
     title: Text('Selected vehicle',style: TextStyle(color: Colors.white,fontSize: 23),),
     centerTitle: true,
    ),



     body:Form(
      key: _formkey,
       child:Column(
        children: [
          TabBar(tabs: [
            Tab(
              text: 'Car details',
              
            ),
            Tab(
              text: 'Customer details',
            )
           ],
           labelColor: Colors.black,
           
           ),
       
       
          //  TAB VIEW >>>>>>>>
       
           Expanded(
             child: TabBarView(children: [
       
       
              // FIRST TAB   (CAR DETAILS)>>>>>>>>>>>>>
       
       
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                       
                       
                      // [ PICK UP & DROP OFF]
                       
                       
                    
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 27),
                            child: TextFormField(
                              controller: _pickupdate,
                              decoration: InputDecoration(
                                filled: true,
                                icon: Icon(Icons.calendar_month),
                                label: Text('Pick up date :'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)
                                ),
                              ),
                              readOnly: true,
                              validator: (value) {
                                if(value==null || value.isEmpty){
                                  return 'Provide a Pick up date';
                                }else{
                                  return null;
                                }
                              },
                              onTap: (){
                                _selectedpickupDate();
                              },
                            ),
                          ),
                          SizedBox(height: 30,),
                             
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right:27 ),
                        child: TextFormField(
                              controller: _dropoffdate,
                          decoration: InputDecoration(
                            filled: true,
                            icon: Icon(Icons.calendar_month),
                            label: Text('Drop off date :'),
                            border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25)
                            ),
                          ),
                          readOnly: true,
                          validator: (value) {
                                if(value==null || value.isEmpty){
                                  return 'Provide a Drop off date';
                                }else{
                                  return null;
                                }
                              },
                              onTap: (){
                                _selecteddropoffDate();
                              },
                        ),
                      ),
                        
                       
                    // [NOTE FIELD ]
                       
                       
                     SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 27),
                      child: TextFormField(
                        controller: _notes,
                        decoration: InputDecoration(
                          filled: true,
                          icon: Icon(Icons.note_alt_outlined,),
                          hintText:'Enter your notes here',
                          label: Text('Notes :'),
                          border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(25)
                          ),
                        ),
                        minLines: 1,
                      maxLines: 10,
                        validator: (value) {
                                if(value==null || value.isEmpty){
                                  return 'Provide notes here';
                                }else{
                                  return null;
                                }
                              },
                      ),
                    ),
                       
                    // [AMOUNTS]
                       
                    SizedBox(height: 30 ,),
                       
                     
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 27),
                            child: TextFormField(
                              controller: _totalamount,
                              decoration: InputDecoration(
                                filled: true,
                                icon: Icon(Icons.currency_rupee_rounded),
                                label: Text('Total amount :'),
                                border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(25)
                                ),
                              ),
                              keyboardType: TextInputType.datetime,
                              validator: (value) {
                                if(value==null || value.isEmpty){
                                  return 'Enter the total amount';
                                }else{
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 30,),
                
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 27),
                        child: TextFormField(
                          controller: _advanceamount,
                          decoration: InputDecoration(
                            filled: true,
                            icon: Icon(Icons.currency_rupee_rounded),
                            label: Text('Advance amount :'),
                            border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25)
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                                if(value==null || value.isEmpty){
                                  return 'Enter the Advance amount';
                                }else{
                                  return null;
                                }
                              },
                        ),
                      ),
                         
                  SizedBox(height: 30,),
                       
                  // Button >>>>>>>
                       
                    Row(
                      children: [
                        SizedBox(width: 235,),
                        ElevatedButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.blueGrey[900],
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(10)
                            ,content: Text('Successfully saved')));
                          _formkey.currentState!.validate();
                        }, child: Text('Save',style: TextStyle(color: Colors.white),),style: ButtonStyle(shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.black)),),
                      ],
                    ) 
                  ],
                ),
              ),
       
       
            // SECOND TAB (CUSTOMER DETAILS)>>>>>>>>>>>>>
              Column(
                children: [
                 
                 SizedBox(height: 30,),
                  // NAME>>>>>>>>
      
                 Padding(
                   padding: const EdgeInsets.only(left: 20,right: 27),
                   child: SingleChildScrollView(
                     child: TextFormField(
                      controller: _customername,
                      decoration: InputDecoration(
                        filled: true,
                        icon: Icon(Icons.person),
                        hintText: 'Customer Name :',
                        border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(25)
                        )
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if(value==null || value.isEmpty){
                          return 'Enter the customer name';
                        }else{
                          return null;
                        }
                      },
                     ),
                   ),
                 ),
                 
                //  MOBILE NUMBER>>>>>>>>>
       
                 SizedBox(height: 30,),
                 Padding(
                   padding: const EdgeInsets.only(left: 20,right: 27),
                   child: TextFormField(
                    controller: _mobilenumber,
                    decoration: InputDecoration(
                        filled: true,
                      icon: Icon(Icons.phone_android_outlined),
                      hintText: 'Mobile Number :',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return 'Enter the Mobile number';
                      }else{
                        return null;
                      }
                    },
                   ),
                 ),
       
                //  ADDRESS>>>>>>>>>
       
                
                 SizedBox(height: 30,),
                 Padding(
                   padding: const EdgeInsets.only(left: 20,right: 27),
                   child: TextFormField(
                    controller: _address,
                    decoration: InputDecoration(
                      icon: Icon(Icons.maps_home_work_outlined),
                      hintText: 'Address :',
                        filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),
                    minLines: 1,
                    maxLines: 6,
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return 'Enter the Address';
                      }else{
                        return null;
                      }
                    },
                   ),
                 ),
       
                // Botton>>>>>>>>>>>>>
       
                SizedBox(height: 30,),
                Row(
                    children: [
                      SizedBox(width: 235,),
                      ElevatedButton(onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.blueGrey[900],
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(10)
                          ,content: Text('Successfully saved')));
                        _formkey.currentState!.validate();
                      }, child: Text('Save',style: TextStyle(color: Colors.white),),style: ButtonStyle(shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: MaterialStatePropertyAll(Colors.black)),),
                    ],
                  ) 
       
                ],
              ),
             ]
             ),
           )
        ],
           ),
     ),
    )
    );
  }


  Future<void> _selecteddropoffDate()async {
    DateTime?pickeded = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2100),initialDate: DateTime.now());

    if(pickeded!= null){
      setState(() {
        _dropoffdate.text = pickeded.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectedpickupDate()async {
   DateTime? picked = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2100),initialDate: DateTime.now());

   if( picked!= null){
    setState(() {
      _pickupdate.text = picked.toString().split(" ")[0];
    });
   }
  }
  
}