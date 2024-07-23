import 'dart:io';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/db_helper/selected_cars_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SelectedCar extends StatefulWidget {
  CarRental carRental;
  SelectedCar({super.key, required this.carRental});

  @override
  State<SelectedCar> createState() => _Selected_carState();
}

class _Selected_carState extends State<SelectedCar> {
  // bool selecetedCarImg = false;
  // List<String> imagePat = [];
  // XFile? selectedImage;
  // bool hasSelectedImage = false;

  // bool selecetedProofImg = false;
  // List<String> imagePaths = [];
  // XFile? selectedImages;
  // bool hasSelectedImages = false;

  File? image24;
  String? imagepat;

  final _formkey = GlobalKey<FormState>();

  final _pickupdate = TextEditingController();
  final _dropoffdate = TextEditingController();
  final _notes = TextEditingController();
  final _currentKm = TextEditingController();
  final _advanceamount = TextEditingController();
  final _customername = TextEditingController();
  final _mobilenumber = TextEditingController();
  final _address = TextEditingController();
  CarRentalService carRental = CarRentalService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[900],
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_pickupdate.text.isNotEmpty &&
                        _dropoffdate.text.isNotEmpty &&
                        _notes.text.isNotEmpty &&
                        _currentKm.text.isNotEmpty &&
                        _advanceamount.text.isNotEmpty &&
                        _customername.text.isNotEmpty &&
                        _mobilenumber.text.isNotEmpty &&
                        _address.text.isNotEmpty) {
                      print('code started');
                      validating();

                      print('validator worked');
                    } else {
                      _formkey.currentState!.validate();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: Colors.black,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(10),
                            content: Text(
                                'Please fill the fields and select an image')),
                      );
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.white24)),
                ),
              )
            ],
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'Selected vehicle',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            // centerTitle: true,
          ),
          body: Form(
            key: _formkey,
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(
                      text: 'Add car details',
                    ),
                    Tab(
                      text: 'Add customer details',
                    )
                  ],
                  labelColor: Colors.black,
                ),

                //  TAB VIEW >>>>>>>>

                Expanded(
                  child: TabBarView(children: [
                    // FIRST TAB   (CAR DETAILS)>>>>>>>>>>>>>

                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 170,
                              width: 290,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.file(
                                    File(widget.carRental.imagex),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 27),
                              child: TextFormField(
                                controller: _pickupdate,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.calendar_month),
                                  label: Text('Pick up date :'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                readOnly: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Provide a Pick up date';
                                  } else {
                                    return null;
                                  }
                                },
                                onTap: () {
                                  _selectedpickupDate();
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 27),
                              child: TextFormField(
                                controller: _dropoffdate,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.calendar_month),
                                  label: Text('Drop off date :'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                readOnly: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Provide a Drop off date';
                                  } else {
                                    return null;
                                  }
                                },
                                onTap: () {
                                  _selecteddropoffDate();
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 27),
                              child: TextFormField(
                                controller: _notes,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.note_alt_outlined),
                                  hintText: 'Enter your notes here',
                                  label: Text('Notes :'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                minLines: 1,
                                maxLines: 10,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Provide notes here';
                                  } else {
                                    return null;
                                  }
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 27),
                              child: TextFormField(
                                controller: _currentKm,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                ],
                                decoration: InputDecoration(
                                  icon: Icon(Icons.mode_of_travel_outlined),
                                  label: Text('Initial Km :'),
                                  hintText: 'Enter the current km ',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                keyboardType: TextInputType.datetime,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter the initial km';
                                  } else {
                                    return null;
                                  }
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 27),
                              child: TextFormField(
                                controller: _advanceamount,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.currency_rupee_rounded),
                                  label: Text('Advance amount :'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter the Advance amount';
                                  } else {
                                    return null;
                                  }
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                ],
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // SECOND TAB (CUSTOMER DETAILS)>>>>>>>>>>>>>

                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 170,
                                  width: 290,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      image: image24 != null
                                          ? DecorationImage(
                                              image: FileImage(image24!),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 5,
                                  child: IconButton(
                                    onPressed: () {
                                      // addphoto(context);
                                      getimage(ImageSource.gallery);
                                      // Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.add_a_photo_outlined,
                                      color: Colors.black,
                                    ),
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    iconSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Upload customer Driving Lisence/valid proof here',
                              style: TextStyle(color: Colors.red),
                            ),

                            SizedBox(
                              height: 30,
                            ),

                            // NAME>>>>>>>>

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 27),
                              child: TextFormField(
                                controller: _customername,
                                decoration: InputDecoration(

                                    // filled: true,
                                    icon: Icon(Icons.person),
                                    hintText: 'Customer Name :',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter the customer name';
                                  } else {
                                    return null;
                                  }
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),

                            //  MOBILE NUMBER>>>>>>>>>

                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 27),
                              child: TextFormField(
                                controller: _mobilenumber,
                                decoration: InputDecoration(
                                    // filled: true,
                                    icon: Icon(Icons.phone_android_outlined),
                                    hintText: 'Mobile Number :',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter the Mobile number';
                                  } else if (value.length != 10) {
                                    return 'Please provide a valid mobile number';
                                  }
                                  return null;
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                ],
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),

                            //  ADDRESS>>>>>>>>>

                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 27),
                              child: TextFormField(
                                controller: _address,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.maps_home_work_outlined),
                                    hintText: 'Address :',
                                    // filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                                minLines: 1,
                                maxLines: 6,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter the Address';
                                  } else {
                                    return null;
                                  }
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),

                            // Botton>>>>>>>>>>>>>

                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ));
  }

Future<void> _selecteddropoffDate() async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
    initialDate: DateTime.now(),
  );

  if (pickedDate != null) {
    setState(() {
      _dropoffdate.text = DateFormat('dd-MM-yyyy').format(pickedDate);
    });
  }
}

  Future<void> _selectedpickupDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());

    if (picked != null) {
      setState(() {
        _pickupdate.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }


  Future<void> getimage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    setState(() {
      image24 = File(image.path);
      imagepat = image.path.toString();
    });
  }

  Future<void> validating() async {
    if (_formkey.currentState!.validate()) {
      final pickup = _pickupdate.text.trim();
      final dropoff = _dropoffdate.text.trim();
      final notes = _notes.text.trim().toString();
      final curkm = _currentKm.text.trim();
      final adamount = _advanceamount.text.trim();
      final cutomerName = _customername.text.trim();
      final mobileNumber = _mobilenumber.text.trim();
      final address = _address.text.trim();

      final carSelected = CarRental(
          imagex: widget.carRental.imagex,
          car: widget.carRental.car,
          brand: widget.carRental.brand,
          model: widget.carRental.model,
          fuel: widget.carRental.fuel,
          seat: widget.carRental.seat,
          number: widget.carRental.number,
          insurance: widget.carRental.insurance,
          pollution: widget.carRental.pollution,
          amount: widget.carRental.amount,
          status: true,
          id: widget.carRental.id,
          pickUpDate: pickup,
          dropOffDate: dropoff,
          notes: notes,
          currentKm: curkm,
          advanceAmount: adamount,
          customerName: cutomerName,
          mobileNumber: mobileNumber,
          address: address,
          image2: imagepat!);
      print('validation finished');
      carRental.editDetails(carSelected);

      print('code finished');

      _pickupdate.clear();
      _dropoffdate.clear();
      _notes.clear();
      _currentKm.clear();
      _advanceamount.clear();
      _customername.clear();
      _mobilenumber.clear();
      _address.clear();
      print('object');

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BottomNavigation(
                currentPage: 2,
              )));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            content: Text('Successfully added')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            content: Text('Please fill the fields and select an image')),
      );
    }
  }
}
