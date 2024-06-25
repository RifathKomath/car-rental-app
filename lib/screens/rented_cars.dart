import 'dart:io';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/due_cars.dart';
import 'package:car_rental/screens/filter_page.dart';
import 'package:car_rental/screens/rented_cars_details.dart';
import 'package:car_rental/screens/side_bar.dart';
import 'package:flutter/material.dart';

class RentedCars extends StatefulWidget {
  RentedCars({Key? key});

  @override
  State<RentedCars> createState() => _Rented_CarsState();
}

class _Rented_CarsState extends State<RentedCars> {
  late TextEditingController searchController;
  final CarRentalService _carRentalService = CarRentalService();

  List<CarRental> _list = [];

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
    await _carRentalService.updateValues();
    _list = await _carRentalService.getDetails();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.blueGrey[900],
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(140),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 250,
                      height: 41,
                      child: SearchBar(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                            leading: Icon(Icons.search,color: Colors.white,),
                            hintText: 'Search',
                            controller: searchController,
                            onChanged: (value) => _carRentalService.searchCar(value),
                            backgroundColor: MaterialStatePropertyAll(Colors.white24),
                            textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                 
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DueCars()));
                    },
                    child: Icon(
                      Icons.car_rental,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white24),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))))),
                ],
              ),
            ),
          ),
        )),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: ValueListenableBuilder(
          valueListenable: CarRentalService.carListNotifier,
          builder: (context, value, child) {
           final listToShow = value.where((element) => element.status).toList();
            return listToShow.isEmpty
                ? Center(
                    child: Text("No available cars"),
                  )
                : ListView.builder(
                    itemCount: listToShow.length,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => RentedCarDetails(carRental: listToShow[index])))
                              .then((value) => _loadDetails());
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                        Text(
                                          "Drop off: ${listToShow[index].dropOffDate}",
                                         style: TextStyle(color: Colors.red),
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
                      car.status = false;
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
