import 'dart:io';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/car_details.dart';
import 'package:flutter/material.dart';

class Filter_Page extends StatefulWidget {
  const Filter_Page({Key? key});

  @override
  State<Filter_Page> createState() => _Filter_PageState();
}

class _Filter_PageState extends State<Filter_Page> {
  final CarRentalService _carRentalService = CarRentalService();
  List<CarRental> _list = [];
  String? _selectedFuelType;
  String? _selectedBrand;
  final style = TextStyle(fontSize: 14);

  // Fetching all data from database
  Future<void> _loadDetails() async {
    _list = await _carRentalService.getDetails();
    setState(() {});
  }

  @override
  void initState() {
    _loadDetails();
    super.initState();
  }

  // Filter function
  bool _filterFunction(CarRental car) {
    if (_selectedFuelType != null && car.fuel != _selectedFuelType) {
      return false;
    }
    if (_selectedBrand != null && car.brand != _selectedBrand) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'Apply filter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            // Filter options
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  // Fuel filter
                  DropdownButton<String>(
                    hint: Text('Select Fuel'),
                    value: _selectedFuelType,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedFuelType = newValue;
                      });
                    },
                    items: ['Petrol', 'Diesel', 'CNG', 'Electric']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                  SizedBox(
                    width: 55,
                  ),

                  // Brand filter
                  DropdownButton<String>(
                    hint: Text('Select Brand'),
                    value: _selectedBrand,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedBrand = newValue;
                      });
                    },
                    items: [
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
                      'Mahindra',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _list.isEmpty
                  ? Center(
                      child: Text("No available cars"),
                    )
                  : ListView.builder(
                      itemCount: _list.length,
                      itemBuilder: (context, index) {
                        final info = _list[index];
                        // Apply filter
                        if (!_filterFunction(info)) {
                          return SizedBox.shrink();
                        }
                        return Container(
                          child: Card(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            elevation: 5.0,
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: SizedBox(
                                height: 200,
                                width: 120,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.file(
                                      File(info.imagex),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              title: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name: ${info.car}",
                                      style: style,
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "Brand: ${info.brand}",
                                      style: style,
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "Model: ${info.model}",
                                      style: style,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        Car_Details(carRental: _list[index])));
                              },
                            ),
                          ),
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
