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
  late TextEditingController searchController;
  final CarRentalService _carRentalService = CarRentalService();

  
  

  List<CarRental> _list = [];
  List<CarRental> _filteredList = [];


  final style = TextStyle(
    fontSize: 14,
  );

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _loadDetails();
  }

  Future<void> _loadDetails() async {
    _carRentalService.updateValues();
    _list = await _carRentalService.getDetails();
    _filteredList = _list; // Initialize the filtered list

    setState(() {});
  }

  void _filterList(String value) {
    if (value.isEmpty) {
      _filteredList = _list;
    } else {
      _filteredList = _list
          .where((car) =>
              car.car.toLowerCase().contains(value.toLowerCase()) ||
              car.brand.toLowerCase().contains(value.toLowerCase()) ||
              car.model.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.blueGrey[900],
            iconTheme: IconThemeData(color: Colors.white),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(140),
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
                          _filterList(value);
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
            List<CarRental> listToShow =value.where((element) => element.status).toList();
               
            return listToShow.isEmpty
                ? Center(
                    child: Text(
                    "No available cars",
                  ))
                : ListView.builder(
                    itemCount: listToShow.length,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => Rented_Car_Details()))
                              .then((value) => setState(() {}));
                        },
                        child: Container(
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
                                          File(listToShow[index].imagex),
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
                                      children: [
                                        Text(
                                          "Name: ${listToShow[index].car}",
                                          style: style,
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          "Brand: ${listToShow[index].brand}",
                                          style: style,
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          "Model: ${listToShow[index].model}",
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
                                            deleteOption(listToShow[index]);
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

  Future<void> deleteOption(CarRental car) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Remove from rented list !'),
            content: Text('Are you sure this car returned'),
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
                       car.status=false;
                      await _carRentalService.editDetails(car);
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
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blueGrey[900]),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
