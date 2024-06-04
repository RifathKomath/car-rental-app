import 'dart:io';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/db_helper/selected_cars_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/models/selected_car.dart';
import 'package:car_rental/screens/filter_page.dart';
import 'package:car_rental/screens/rented_cars_details.dart';
import 'package:flutter/material.dart';

class Rented_Cars extends StatefulWidget {


   Rented_Cars({Key? key});

  @override
  State<Rented_Cars> createState() => _Rented_CarsState();
}

class _Rented_CarsState extends State<Rented_Cars> {
  late TextEditingController searchController = TextEditingController();
  late List<CarRental> _filteredCars = [];

  final CarRentalService _carRentalService = CarRentalService();

  List<CarRental> _list = [];

  final style = TextStyle(
    fontSize: 14,
  );

  int get getIndex => 0;

  void deleteOpenedCar() {
    int index = getIndex; // Assuming getIndex is a getter returning the currently opened index
    if (index >= 0) {
      deleteOption(index);
    }
  }

  // fetching all datas from db

  Future<void> _loadDetails() async {
    _carRentalService.updateValues();
    _list = await _carRentalService.getDetails();
    _filteredCars = List.from(_list); // Initialize filtered cars with all cars
    setState(() {});
  }

  @override
  void initState() {
    _loadDetails();
    searchController = TextEditingController();
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    // Filter based on entered keyword
    List<CarRental> result = _list
        .where((car) =>
            car.car.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
            car.brand.toLowerCase().contains(enteredKeyword.toLowerCase()))
        .toList();
    setState(() {
      _filteredCars = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blueGrey[900],
            iconTheme: IconThemeData(color: Colors.white),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 45,
                      width: 250,
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (value) {
                          _runFilter(
                              value); // Call filter function on text change
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Search',
                          labelStyle: TextStyle(color: Colors.white),
                          suffixIcon: Icon(Icons.search, color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Filter_Page()));
                        },
                        child: Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white24),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))))
                  ],
                ),
              ),
            ),
          )),

      // drawer>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: ValueListenableBuilder(
          valueListenable: CarRentalService.carListNotifier,
          builder: (context, value, child) {
            return _filteredCars.isEmpty
                ? Center(
                    child: Text(
                    "No available cars",
                  ))
                : ListView.builder(
                    itemCount: _filteredCars.length,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => 
                                Rented_Car_Details()
                                  
                                      )
                                      )
                              .then((value) => setState(() {}));
                        },
                        child: Container(
                          // height: 15,
                          child: Card(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            elevation: 5.0,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: 70,
                                    width: 110,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.file(
                                          File(_filteredCars[index].imagex),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Name: ${_filteredCars[index].car}",
                                          style: style,
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          "Brand: ${_filteredCars[index].brand}",
                                          style: style,
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          "Model: ${_filteredCars[index].model}",
                                          style: style,
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            deleteOption(index);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            size: 25,
                                            color: Colors.blueGrey[900],
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                  );
          },
        ),
      ),
    );
  }

  Future<void> deleteOption(int index) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete !'),
            content: Text('Are you sure want to delete this car from the list'),
            actions: [
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.blueGrey[900]),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () async {
                      await _carRentalService.deleteDetails(index);
                      _loadDetails();
                      Navigator.pop(context); // Close the dialog after deletion
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      backgroundColor: MaterialStatePropertyAll(Colors.blueGrey[900]),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
