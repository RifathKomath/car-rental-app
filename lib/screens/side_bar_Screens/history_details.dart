import 'dart:io';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:flutter/material.dart';

class historyDetailPage extends StatefulWidget {
  CarRental carRental;
  historyDetailPage({super.key, required this.carRental});

  @override
  State<historyDetailPage> createState() => _historyDetailPageState();
}

class _historyDetailPageState extends State<historyDetailPage> {
  final CarRentalService _carRentalService = CarRentalService();

  final textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  final subTextStyle = TextStyle(fontSize: 16);

  @override
  void initState() {
    _carRentalService.updateValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History of car',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900],
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 170,
                  width: 290,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.file(
                        File(widget.carRental.imagex),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Divider(),
                        ),
                        Row(
                          children: [
                            Text('Car name', style: textStyle),
                            SizedBox(
                              width: 122,
                            ),
                            Text(
                              ':',
                              style: subTextStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${widget.carRental.car}',
                              style: subTextStyle,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Divider(),
                        ),
                        Row(
                          children: [
                            Text('Brand name', style: textStyle),
                            SizedBox(
                              width: 103.5,
                            ),
                            Text(
                              ':',
                              style: subTextStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('${widget.carRental.brand}',
                                style: subTextStyle)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Divider(),
                        ),
                        Row(
                          children: [
                            Text('Reg_Number', style: textStyle),
                            SizedBox(
                              width: 97,
                            ),
                            Text(
                              ':',
                              style: subTextStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${widget.carRental.number}',
                              style: subTextStyle,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Divider(),
                        ),
                        Row(
                          children: [
                            Text('Last pickup date', style: textStyle),
                            SizedBox(
                              width: 70,
                            ),
                            Text(
                              ':',
                              style: subTextStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${widget.carRental.pickUpDate}',
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Divider(),
                        ),
                        Row(
                          children: [
                            Text('Last drop off date', style: textStyle),
                            SizedBox(
                              width: 61,
                            ),
                            Text(
                              ':',
                              style: subTextStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${widget.carRental.dropOffDate}',
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 5, right: 20),
                          child: Container(
                            width: double.infinity,
                            child: Card(
                                color: Colors.white,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        'History of the car :',
                                        style: textStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                      height: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, bottom: 8),
                                          child: Text(
                                            '${widget.carRental.history}',
                                            style: subTextStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
