import 'dart:io';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/screens/car_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class EditingPage extends StatefulWidget {
  CarRental carRental;

  EditingPage({super.key, required this.carRental});

  @override
  State<EditingPage> createState() => _Adding_carsState();
}

class _Adding_carsState extends State<EditingPage> {
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

  final _formkey = GlobalKey<FormState>();

  final CarRentalService _carRentalSevice = CarRentalService();

  List<String> BrandTypes = [
    'Toyota',
    'Jeep',
    'Suzuki',
    'Range Rover',
    'Mini Cooper',
    'Renault',
    'Tata',
    'BMW',
    'Mercedes Benz',
    'Hyundai',
    'Honda',
    'Volvo',
    'Kia',
    'Mahindra'
  ];
  String? selectedBrandTypes;

  List<String> seatTypes = [
    '2',
    '4',
    '5',
    '6',
    '7',
  ];
  String? selectedSeattypes;

  List<String> fuelTypes = [
    'Diesel',
    'Petrol',
    'CNG',
    'Electric',
    'Other',
  ];
  String? selectedFueltypes;

  @override
  void initState() {
    _nameController.text = widget.carRental.car;
    selectedBrandTypes = widget.carRental.brand;
    _modelController.text = widget.carRental.model;
    selectedFueltypes = widget.carRental.fuel;
    selectedSeattypes = widget.carRental.seat;
    _regnumberController.text = widget.carRental.number;
    _insuranceController.text = widget.carRental.insurance;
    _pollutionController.text = widget.carRental.pollution;
    _amountController.text = widget.carRental.amount;

    if (widget.carRental.imagex != null) {
      setState(() {
        image25 = File(widget.carRental.imagex!);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty ||
                    _brandController.text.isNotEmpty ||
                    _modelController.text.isNotEmpty ||
                    _fuelController.text.isNotEmpty ||
                    _seatController.text.isNotEmpty ||
                    _regnumberController.text.isNotEmpty ||
                    _insuranceController.text.isNotEmpty ||
                    _pollutionController.text.isNotEmpty ||
                    _amountController.text.isNotEmpty) {
                  if (_formkey.currentState!.validate() && image25 != null) {
                    editingDetails();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(10),
                        content: Text('Please fill the required fields'),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.black,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10),
                      content: Text('Please fill the field'),
                    ),
                  );
                }
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white24),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        image: image25 != null
                            ? DecorationImage(
                                image: FileImage(image25!),
                                fit: BoxFit.cover,
                              )
                            : null,
                        borderRadius: BorderRadius.circular(15)),
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

              // Name>>>>>>>>>>>>>>>>

              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 27,
                ),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      // filled: true,
                      icon: Icon(Icons.directions_car_filled),
                      label: Text(' Car name :'),
                      hintText: 'Please enter the car Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Car Name is Empty ';
                    } else {
                      return null;
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s'))
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),

              SizedBox(
                height: 20,
              ),
              // Brand>>>>>>>>>>>>>>>>>>

              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 27,
                ),
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(40),
                  value: selectedBrandTypes,
                  onChanged: (newValue) {
                    setState(() {
                      selectedBrandTypes = newValue;
                    });
                  },
                  items: BrandTypes.map((mode) {
                    return DropdownMenuItem<String>(
                      value: mode,
                      child: Text(mode),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    //  filled: true,
                    icon: Icon(Icons.directions_car_filled),
                    label: Text('Brand :'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select one Brand';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),

              // Model>>>>>>>>>>>>>>>>>>

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 27,
                ),
                child: TextFormField(
                  controller: _modelController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_month),
                      label: Text('Model :'),
                      // filled: true,
                      hintText: 'Please enter the model year',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.deny(RegExp(r'\s'))
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Car Model is Empty ';
                    } else {
                      return null;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // Fuel>>>>>>>>>>>>>>>>>>>>>>

              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 27,
                ),
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(40),
                  value: selectedFueltypes,
                  onChanged: (newValue) {
                    setState(() {
                      selectedFueltypes = newValue;
                    });
                  },
                  items: fuelTypes.map((mode) {
                    return DropdownMenuItem<String>(
                      value: mode,
                      child: Text(mode),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    //  filled: true,
                    icon: Icon(Icons.airline_seat_recline_extra_sharp),
                    label: Text('Fuel type :'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select one item';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),

              // Seat capacity>>>>>>>>>>>>>>>>>>>

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 27,
                ),
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(40),
                  value: selectedSeattypes,
                  onChanged: (newValue) {
                    setState(() {
                      selectedSeattypes = newValue;
                    });
                  },
                  items: seatTypes.map((mode) {
                    return DropdownMenuItem<String>(
                      value: mode,
                      child: Text(mode),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    //  filled: true,
                    icon: Icon(Icons.airline_seat_recline_extra_sharp),
                    label: Text('Seat capacity :'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select one item';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),

              // Reg number>>>>>>>>>>>>>>>>>>>>>>>>>

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 27,
                ),
                child: TextFormField(
                  controller: _regnumberController,
                  decoration: InputDecoration(
                    // filled: true,
                    icon: Icon(Icons.onetwothree_rounded),
                    label: Text('Reg Number :'),
                    hintText: 'Please enter the car Reg Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Reg number is Empty';
                    } else {
                      return null;
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s'))
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),

              // Insurance>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 27,
                ),
                child: TextFormField(
                  controller: _insuranceController,
                  readOnly: true,
                  decoration: InputDecoration(
                      // filled: true,
                      icon: Icon(Icons.note),
                      label: Text('Insurance Upto :'),
                      hintText: 'Please enter the Insurance date',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insurance is Empty';
                    } else {
                      return null;
                    }
                  },
                  onTap: () {
                    _selectedinsuranceDate();
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),

              // Pollution>>>>>>>>>>>>>>>>>>>>>>

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 27,
                ),
                child: TextFormField(
                  controller: _pollutionController,
                  readOnly: true,
                  decoration: InputDecoration(
                      // filled: true,
                      icon: Icon(Icons.note),
                      label: Text('Pollution Upto :'),
                      hintText: 'Please enter the pollution date',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pollution is Empty';
                    } else {
                      return null;
                    }
                  },
                  onTap: () {
                    _selectedpollutionDate();
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),

              // Amount >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 27,
                ),
                child: TextFormField(
                  controller: _amountController,
                  decoration: InputDecoration(
                      // filled: true,
                      icon: Icon(Icons.currency_rupee_rounded),
                      label: Text('Amount of the Car :'),
                      hintText: 'Please enter amount of the car ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.deny(RegExp(r'\s'))
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Car amount is Empty';
                    } else {
                      return null;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),

              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> editingDetails() async {
    if (_formkey.currentState!.validate() && image25 != null) {
      final car = _nameController.text.trim();
      final brand = selectedBrandTypes!;
      final model = _modelController.text.trim().toString();
      final fuel = selectedFueltypes!;
      final seat = selectedSeattypes!;
      final reg_num = _regnumberController.text.trim().toUpperCase().toString();
      final insurance = _insuranceController.text.trim();
      final pollution = _pollutionController.text.trim();
      final amount = _amountController.text.trim().toString();

      final newcar = CarRental(
        id: widget.carRental.id,
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
      // int index = 0;

      await _carRentalSevice.editDetails(newcar);

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

      Navigator.of(context).pop(newcar);

      Navigator.of(context).pushReplacement(
        // Push the same page again
        MaterialPageRoute(
          builder: (context) => CarDetails(carRental: newcar),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text('Successfully edited'),
        ),
      );
    } else {
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

  Future<void> _selectedinsuranceDate() async {
    DateTime? pickeded = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());

    if (pickeded != null) {
      setState(() {
        _insuranceController.text = pickeded.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectedpollutionDate() async {
    DateTime? pickeded = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());

    if (pickeded != null) {
      setState(() {
        _pollutionController.text = pickeded.toString().split(" ")[0];
      });
    }
  }
}
