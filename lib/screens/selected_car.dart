import 'dart:io';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/db_helper/selected_cars_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class SelectedCar extends StatefulWidget {
  CarRental carRental;
  SelectedCar({super.key, required this.carRental});

  @override
  State<SelectedCar> createState() => _Selected_carState();
}

class _Selected_carState extends State<SelectedCar> {
  bool selecetedCarImg = false;
  List<String> imagePat = [];
  XFile? selectedImage;
  bool hasSelectedImage = false;

  bool selecetedProofImg = false;
  List<String> imagePaths = [];
  XFile? selectedImages;
  bool hasSelectedImages = false;

  final _formkey = GlobalKey<FormState>();

  final selectedCarService _selectedCarSevice = selectedCarService();

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
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                    imagePat.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 250,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border:
                                              Border.all(color: Colors.black),
                                          image: DecorationImage(
                                            image: imagePat.isNotEmpty
                                                ? FileImage(
                                                    File(imagePat[index]))
                                                : const AssetImage("")
                                                    as ImageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: IconButton(
                                        onPressed: () {
                                          addCarImage(context);
                                        },
                                        icon: Icon(
                                          Icons.add_a_photo,
                                          size: 50,
                                          color: Colors.blueGrey[900],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                  label: Text('Current Km :'),
                                  hintText: 'Enter the current km ',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                keyboardType: TextInputType.datetime,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter the current km';
                                  } else {
                                    return null;
                                  }
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // Additional widgets (e.g., buttons) can be added here
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
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                    imagePaths.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 250,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border:
                                              Border.all(color: Colors.black),
                                          image: DecorationImage(
                                            image: imagePaths.isNotEmpty
                                                ? FileImage(
                                                    File(imagePaths[index]))
                                                : const AssetImage("")
                                                    as ImageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: IconButton(
                                        onPressed: () {
                                          addProofImage(context);
                                        },
                                        icon: Icon(
                                          Icons.add_a_photo,
                                          size: 50,
                                          color: Colors.blueGrey[900],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                 autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                 autovalidateMode: AutovalidateMode.onUserInteraction,
                              ),
                            ),

                            // Botton>>>>>>>>>>>>>

                            SizedBox(
                              height: 30,
                            ),
                            // Row(
                            //   children: [
                            //     SizedBox(
                            //       width: 235,
                            //     ),
                            //     ElevatedButton(
                            //       onPressed: () {
                            //         if (_customername.text.isNotEmpty ||
                            //             _mobilenumber.text.isNotEmpty ||
                            //             _address.text.isNotEmpty) {
                            //           validating();
                            //         } else {
                            //           _formkey.currentState!.validate() &&
                            //               image24 != null;

                            //           ScaffoldMessenger.of(context)
                            //               .showSnackBar(
                            //             SnackBar(
                            //                 backgroundColor: Colors.black,
                            //                 behavior: SnackBarBehavior.floating,
                            //                 margin: EdgeInsets.all(10),
                            //                 content: Text(
                            //                     'Please fill the fields and select an image')),
                            //           );
                            //         }
                            //       },
                            //       child: Text(
                            //         'Save',
                            //         style: TextStyle(color: Colors.white),
                            //       ),
                            //       style: ButtonStyle(
                            //           shape: MaterialStatePropertyAll(
                            //               RoundedRectangleBorder(
                            //                   borderRadius:
                            //                       BorderRadius.circular(10))),
                            //           backgroundColor: MaterialStatePropertyAll(
                            //               Colors.black)),
                            //     ),
                            //   ],
                            // )
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
    DateTime? pickeded = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());

    if (pickeded != null) {
      setState(() {
        _dropoffdate.text = pickeded.toString().split(" ")[0];
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
        _pickupdate.text = picked.toString().split(" ")[0];
      });
    }
  }
//  car details image picker>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  // Future<void> validator() async {
  //   if (_formkey.currentState!.validate() && image25 != null) {
  //     final pickUp = _pickupdate.text.trim();
  //     final dropOff = _dropoffdate.text.trim();
  //     final notes = _notes.text.trim().toString();
  //     final currentKiloMeter = _currentKm.text.trim();
  //     final AdvaAmount = _advanceamount.text.trim();

  //     final rentalDetails = selectedCars(
  //         image1: imagepath!,
  //         pickUpDate: pickUp,
  //         dropOffDate: dropOff,
  //         notes: notes,
  //         currentKm: currentKiloMeter,
  //         advanceAmount: AdvaAmount);

  //     await _selectedCarSevice.addDetails(rentalDetails);

  //     image25 = null;
  //     _pickupdate.clear();
  //     _dropoffdate.clear();
  //     _notes.clear();
  //     _currentKm.clear();
  //     _advanceamount.clear();

  //     // ScaffoldMessenger.of(context).showSnackBar(
  //     //   SnackBar(
  //     //       backgroundColor: Colors.black,
  //     //       behavior: SnackBarBehavior.floating,
  //     //       margin: EdgeInsets.all(10),
  //     //       content: Text('Please fill the customer details also for that swipe to left')),
  //     // );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //           backgroundColor: Colors.black,
  //           behavior: SnackBarBehavior.floating,
  //           margin: EdgeInsets.all(10),
  //           content: Text('Please fill the fields and select an image')),
  //     );
  //   }
  // }

  // Future<void> validating() async {
  //   if (_formkey.currentState!.validate() && image24 != null) {
  //     final name = _customername.text.trim();
  //     final mobileNumber = _mobilenumber.text.trim();
  //     final address = _address.text.trim().toString();

  //     final rentalDetailsSec = selectedCarSecTab(
  //         image2: imagepaths!,
  //         customerName: name,
  //         mobileNumber: mobileNumber,
  //         address: address);

  //     await _selectedCarTabSevice.addDetail(rentalDetailsSec);

  //     image24 = null;
  //     _customername.clear();
  //     _mobilenumber.clear();
  //     _address.clear();

  //     // ScaffoldMessenger.of(context).showSnackBar(
  //     //   SnackBar(
  //     //       backgroundColor: Colors.black,
  //     //       behavior: SnackBarBehavior.floating,
  //     //       margin: EdgeInsets.all(10),
  //     //       content: Text('Please fill the customer details also for that swipe to left')),
  //     // );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         backgroundColor: Colors.blueGrey[900],
  //         behavior: SnackBarBehavior.floating,
  //         margin: EdgeInsets.all(10),
  //         content: Text('Successfully saved')));
  //     _formkey.currentState!.validate();
  //   }
  // }

  Future<void> addCarImage(BuildContext context) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickMultiImage();
    setState(() {
      imagePat.clear();
      for (final multiImg in pickedImage) {
        imagePat.add(multiImg.path);
      }
      selecetedCarImg = imagePat.isNotEmpty;
    });
  }

  Future<void> addProofImage(BuildContext context) async {
    final imagePick = ImagePicker();
    final pickedProofImage = await imagePick.pickMultiImage();
    setState(() {
      imagePaths.clear();
      for (final multiImges in pickedProofImage) {
        imagePaths.add(multiImges.path);
      }
      selecetedProofImg = imagePaths.isNotEmpty;
    });
    }

  Future<void> validating() async {
    if (_formkey.currentState!.validate()) {
      final pickup = _pickupdate.text.trim();
      final dropoff = _dropoffdate.text.trim();
      final notes = _notes.text.trim().toString();
      final curkm = _currentKm.text.trim();
      final adamount = _advanceamount.text.trim();
      final cutomerName = _customername.text.trim().toString();
      final mobileNumber = _mobilenumber.text.trim();
      final address = _address.text.trim();

      // final selecteCarDetail = selectedCars(image1:imagePaths, pickUpDate: pickup, dropOffDate: dropoff, notes: notes, currentKm: curkm, advanceAmount: adamount, image2: imagePaths, customerName: cutomerName, mobileNumber: mobileNumber, address: address);

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
        image1: imagePat,
        image2: imagePaths,
      
      );
      print('validation finished');
      carRental.editDetails(carSelected);

      // await _selectedCarSevice.addDetails(selecteCarDetail);

      print('code finished');

      imagePaths.clear();
      imagePat.clear();
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
