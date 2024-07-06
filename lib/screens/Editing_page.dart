import 'dart:io';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/screens/car_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class EditingPage extends StatefulWidget {
  final CarRental carRental;

  EditingPage({super.key, required this.carRental});

  @override
  State<EditingPage> createState() => _EditingPageState();
}

class _EditingPageState extends State<EditingPage> {
  File? imageFile;
  String? imagePath;

  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _modelController = TextEditingController();
  final _fuelController = TextEditingController();
  final _seatController = TextEditingController();
  final _regnumberController = TextEditingController();
  final _insuranceController = TextEditingController();
  final _pollutionController = TextEditingController();
  final _amountController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final CarRentalService _carRentalService = CarRentalService();

  List<String> brandTypes = [
    'Toyota', 'Jeep', 'Suzuki', 'Range Rover', 'Mini Cooper', 'Renault',
    'Tata', 'BMW', 'Mercedes Benz', 'Hyundai', 'Honda', 'Volvo', 'Kia', 'Mahindra'
  ];
  String? selectedBrandType;

  List<String> seatTypes = ['2', '4', '5', '6', '7'];
  String? selectedSeatType;

  List<String> fuelTypes = ['Diesel', 'Petrol', 'CNG', 'Electric', 'Other'];
  String? selectedFuelType;

  @override
  void initState() {
    super.initState();
    _initializeFormData();
  }

  void _initializeFormData() {
    _nameController.text = widget.carRental.car;
    selectedBrandType = widget.carRental.brand;
    _modelController.text = widget.carRental.model;
    selectedFuelType = widget.carRental.fuel;
    selectedSeatType = widget.carRental.seat;
    _regnumberController.text = widget.carRental.number;
    _insuranceController.text = widget.carRental.insurance;
    _pollutionController.text = widget.carRental.pollution;
    _amountController.text = widget.carRental.amount;

    if (widget.carRental.imagex != null) {
      setState(() {
        imageFile = File(widget.carRental.imagex!);
      });
    }
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
              onPressed: _saveDetails,
              child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 17)),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
                backgroundColor: MaterialStateProperty.all(Colors.white24),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildImagePicker(),
              SizedBox(height: 30),
              _buildTextField(_nameController, 'Car name', Icons.directions_car_filled, 'Please enter the car Name'),
              SizedBox(height: 20),
              _buildDropdownButtonFormField(selectedBrandType, brandTypes, 'Brand', Icons.directions_car_filled),
              SizedBox(height: 20),
              _buildTextField(_modelController, 'Model', Icons.calendar_month, 'Please enter the model year', TextInputType.number),
              SizedBox(height: 20),
              _buildDropdownButtonFormField(selectedFuelType, fuelTypes, 'Fuel type', Icons.local_gas_station),
              SizedBox(height: 20),
              _buildDropdownButtonFormField(selectedSeatType, seatTypes, 'Seat capacity', Icons.airline_seat_recline_extra),
              SizedBox(height: 20),
              _buildTextField(_regnumberController, 'Reg Number', Icons.onetwothree_rounded, 'Please enter the car Reg Number'),
              SizedBox(height: 20),
              _buildDatePicker(_insuranceController, 'Insurance Upto', Icons.date_range),
              SizedBox(height: 20),
              _buildDatePicker(_pollutionController, 'Pollution Upto', Icons.date_range),
              SizedBox(height: 20),
              _buildTextField(_amountController, 'Amount of the Car', Icons.currency_rupee_rounded, 'Please enter amount of the car ', TextInputType.number),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Stack(
      children: [
        Container(
          width: 250,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(),
            image: imageFile != null
                ? DecorationImage(image: FileImage(imageFile!), fit: BoxFit.cover)
                : null,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 5,
          child: IconButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            icon: const Icon(Icons.add_a_photo_outlined, color: Colors.black, size: 30),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, String hintText, [TextInputType keyboardType = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is Empty';
          } else {
            return null;
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }

  Widget _buildDropdownButtonFormField(String? value, List<String> items, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: (newValue) {
          setState(() {
            if (label == 'Brand') selectedBrandType = newValue;
            else if (label == 'Fuel type') selectedFuelType = newValue;
            else if (label == 'Seat capacity') selectedSeatType = newValue;
          });
        },
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select one $label';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }

  Widget _buildDatePicker(TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: label,
          hintText: 'Please enter the $label date',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is Empty';
          } else {
            return null;
          }
        },
        onTap: () {
          _selectDate(controller);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }

  Future<void> _selectDate(TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = pickedDate.toString().split(" ")[0];
      });
    }
  }

  Future<void> _saveDetails() async {
    if (_formKey.currentState!.validate() && imageFile != null) {
      final carRental = CarRental(
        id: widget.carRental.id,
        imagex: imagePath!,
        car: _nameController.text.trim(),
        brand: selectedBrandType!,
        model: _modelController.text.trim(),
        fuel: selectedFuelType!,
        seat: selectedSeatType!,
        number: _regnumberController.text.trim().toUpperCase(),
        insurance: _insuranceController.text.trim(),
        pollution: _pollutionController.text.trim(),
        amount: _amountController.text.trim(),
      );

      await _carRentalService.editDetails(carRental);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => CarDetails(carRental: carRental),
      ));
    } else {
      if (imageFile == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select an image.')),
        );
      }
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
          imagePath = pickedFile.path;
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
