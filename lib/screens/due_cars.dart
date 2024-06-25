import 'dart:io';

import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/car_details.dart';
import 'package:car_rental/screens/rented_cars_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class DueCars extends StatefulWidget {
  const DueCars({super.key});

  @override
  State<DueCars> createState() => _dueCarsState();
}

class _dueCarsState extends State<DueCars> {
  CarRentalService carRentalService = CarRentalService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Due cars',
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
            var date = [];
            if (element.dropOffDate != null) {
              date = element.dropOffDate!.split('-').toList();
            }

            return element.status &&
                DateTime.now().month >= int.parse(date[1]) &&
                DateTime.now().day >= int.parse(date[2]);
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
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,left: 8,right: 8),
                        child: Card(
                          color: Colors.white,
                          // margin: EdgeInsets.symmetric(vertical: 8.0),
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

                                      //    TextButton(
                                      // onPressed: () {
                                      //   FlutterPhoneDirectCaller.callNumber(
                                      //       '${value[index].mobileNumber}');
                                      // },
                                      // child: Text(
                                      //     '${value[index].mobileNumber}')),
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
                );
        },
      ),
    );
  }
}
