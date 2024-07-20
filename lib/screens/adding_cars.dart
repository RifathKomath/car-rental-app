import 'dart:io';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/screens/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddingCars extends StatefulWidget {
  const AddingCars({super.key});

  @override
  State<AddingCars> createState() => _AddingCarsState();
}

class _AddingCarsState extends State<AddingCars> {
  File? image25;
  String? imagepath;

  final _formKey = GlobalKey<FormState>();
  final _carRentalService = CarRentalService();

  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _modelController = TextEditingController();
  final _fuelController = TextEditingController();
  final _seatController = TextEditingController();
  final _regNumberController = TextEditingController();
  final _insuranceController = TextEditingController();
  final _pollutionController = TextEditingController();
  final _amountController = TextEditingController();

  String? selectedBrandType;
  String? selectedSeatType;
  String? selectedFuelType;

  final List<String> brandTypes = [
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

  final List<String> seatTypes = ['2', '4', '5', '6', '7'];
  final List<String> fuelTypes = [
    'Diesel',
    'Petrol',
    'CNG',
    'Electric',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: ElevatedButton(
              onPressed: _saveCar,
              child: const Text('Save',
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(Colors.white24)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildImagePicker(),
              const SizedBox(height: 30),
              _buildTextField(
                controller: _nameController,
                icon: Icons.directions_car_filled,
                label: 'Car name :',
                hintText: 'Please enter the car name',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Car name is empty' : null,
              ),
              const SizedBox(height: 20),
              _buildDropdownButton(
                value: selectedBrandType,
                items: brandTypes,
                icon: Icons.directions_car_filled,
                label: 'Brand :',
                onChanged: (newValue) =>
                    setState(() => selectedBrandType = newValue),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please select a brand'
                    : null,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _modelController,
                icon: Icons.calendar_month,
                label: 'Model :',
                hintText: 'Please enter the model year',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
                validator: (value) => value == null || value.isEmpty
                    ? 'Car model is empty'
                    : null,
              ),
              const SizedBox(height: 20),
              _buildDropdownButton(
                value: selectedFuelType,
                items: fuelTypes,
                icon: Icons.ev_station_sharp,
                label: 'Fuel type :',
                onChanged: (newValue) =>
                    setState(() => selectedFuelType = newValue),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please select a fuel type'
                    : null,
              ),
              const SizedBox(height: 20),
              _buildDropdownButton(
                value: selectedSeatType,
                items: seatTypes,
                icon: Icons.airline_seat_recline_extra_sharp,
                label: 'Seat capacity :',
                onChanged: (newValue) =>
                    setState(() => selectedSeatType = newValue),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please select a seat capacity'
                    : null,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _regNumberController,
                icon: Icons.onetwothree_rounded,
                label: 'Reg Number :',
                hintText: 'Please enter the car reg number',
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s'))
                ],
                validator: (value) => value == null || value.isEmpty
                    ? 'Reg number is empty'
                    : null,
              ),
              const SizedBox(height: 20),
              _buildDatePickerField(
                controller: _insuranceController,
                icon: Icons.note,
                label: 'Insurance Upto :',
                hintText: 'Please enter the insurance date',
                onTap: _selectInsuranceDate,
                validator: (value) => value == null || value.isEmpty
                    ? 'Insurance is empty'
                    : null,
              ),
              const SizedBox(height: 20),
              _buildDatePickerField(
                controller: _pollutionController,
                icon: Icons.note,
                label: 'Pollution Upto :',
                hintText: 'Please enter the pollution date',
                onTap: _selectPollutionDate,
                validator: (value) => value == null || value.isEmpty
                    ? 'Pollution is empty'
                    : null,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _amountController,
                icon: Icons.currency_rupee_rounded,
                label: 'Amount of the Car :',
                hintText: 'Please enter the amount of the car',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
                validator: (value) => value == null || value.isEmpty
                    ? 'Car amount is empty'
                    : null,
              ),
              const SizedBox(height: 50),
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
          height: 170,
          width: 290,
          decoration: BoxDecoration(
              border: Border.all(),
              image: image25 != null
                  ? DecorationImage(
                      image: FileImage(image25!), fit: BoxFit.cover)
                  : null,
              borderRadius: BorderRadius.circular(10)),
        ),
        Positioned(
          bottom: 0,
          right: 5,
          child: IconButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            icon: const Icon(Icons.add_a_photo_outlined, color: Colors.black),
            color: const Color.fromARGB(255, 255, 255, 255),
            iconSize: 30,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    void Function()? onTap,
    bool readOnly = false,
  }) {
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
        inputFormatters: inputFormatters,
        validator: validator,
        onTap: onTap,
        readOnly: readOnly,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }

  Widget _buildDropdownButton({
    required String? value,
    required List<String> items,
    required IconData icon,
    required String label,
    void Function(String?)? onChanged,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        items: items
            .map((item) =>
                DropdownMenuItem<String>(value: item, child: Text(item)))
            .toList(),
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: label,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }

  Widget _buildDatePickerField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    required String hintText,
    void Function()? onTap,
    String? Function(String?)? validator,
  }) {
    return _buildTextField(
      controller: controller,
      icon: icon,
      label: label,
      hintText: hintText,
      onTap: onTap,
      readOnly: true,
      validator: validator,
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        image25 = File(pickedFile.path);
        imagepath = pickedFile.path;
      });
    }
  }

  Future<void> _selectInsuranceDate() async {
    final selectedDate = await _selectDate();
    if (selectedDate != null) {
      _insuranceController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
    }
  }

  Future<void> _selectPollutionDate() async {
    final selectedDate = await _selectDate();
    if (selectedDate != null) {
      _pollutionController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
    }
  }

  Future<DateTime?> _selectDate() async {
    final now = DateTime.now();
    return await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );
  }

  void _saveCar() {
    if (_formKey.currentState!.validate() && image25 != null) {
      final newCar = CarRental(
        imagex: imagepath,
        car: _nameController.text,
        brand: selectedBrandType!,
        model: _modelController.text,
        fuel: selectedFuelType!,
        seat: selectedSeatType!,
        number: _regNumberController.text,
        insurance: _insuranceController.text,
        pollution: _pollutionController.text,
        amount: _amountController.text,
      );
      _carRentalService.addCar(newCar);

            ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            content: Text('Successfully added')),
      );
            Navigator.push(
          context, MaterialPageRoute(builder: (_) => BottomNavigation()));
    } else if (image25 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Image is empty')));
    }
  }
}
