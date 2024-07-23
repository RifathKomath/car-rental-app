import 'dart:io';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/rented_cars_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DueCars extends StatefulWidget {
  const DueCars({super.key});

  @override
  State<DueCars> createState() => _DueCarsState();
}

class _DueCarsState extends State<DueCars> {
  CarRentalService carRentalService = CarRentalService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Due Cars',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: ValueListenableBuilder(
        valueListenable: CarRentalService.carListNotifier,
        builder: (context, value, child) {
          List<CarRental> data = value.where((element) {
            if (element.dropOffDate == null || element.dropOffDate!.isEmpty) {
              return false;
            }
            try {
              DateTime dropOffDate = DateFormat('dd-MM-yyyy').parse(element.dropOffDate!);
              print('Car: ${element.car}, Drop Off Date: $dropOffDate, Now: ${DateTime.now()}, Status: ${element.status}');
              return element.status && DateTime.now().isAfter(dropOffDate);
            } catch (e) {
              print('Error parsing date for car: ${element.car}');
              return false;
            }
          }).toList();

          return data.isEmpty
              ? Center(
                  child: Text("No due cars"),
                )
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (context) => RentedCarDetails(
                                    carRental: data[index],
                                  )))
                          .then((value) => setState(() {}));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Card(
                            color: Colors.white,
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
                                          File(data[index].imagex),
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Icon(Icons.error);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Customer: ${data[index].customerName}",
                                          style: TextStyle(fontSize: 14),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          "Name: ${data[index].car}",
                                          style: TextStyle(fontSize: 14),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          "Reg No: ${data[index].number}",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.red),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          "Drop off: ${data[index].dropOffDate}",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.red),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
