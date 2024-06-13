import 'dart:io';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/bottom_navigation.dart';
import 'package:car_rental/screens/editing_page.dart';
import 'package:car_rental/screens/selected_car.dart';
import 'package:flutter/material.dart';

class Car_Details extends StatefulWidget {
  CarRental carRental;

  Car_Details({Key? key, required this.carRental}) : super(key: key);

  @override
  State<Car_Details> createState() => _Car_detailsState();
}

class _Car_detailsState extends State<Car_Details> {
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
          'Car details',
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
                        SizedBox(height: 10,),
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
                            Text('Model', style: textStyle),
                            SizedBox(
                              width: 146,
                            ),
                             Text(
                              ':',
                              style: subTextStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${widget.carRental.model}',
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
                            Text('Fuel type', style: textStyle),
                            SizedBox(
                              width: 124.7,
                            ),
                             Text(
                              ':',
                              style: subTextStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${widget.carRental.fuel}',
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
                            Text('Seat capacity', style: textStyle),
                            SizedBox(
                              width: 92,
                            ),
                             Text(
                              ':',
                              style: subTextStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${widget.carRental.seat}',
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
                            Text('Insurance Upto', style: textStyle),
                            SizedBox(
                              width: 80,
                            ),
                             Text(
                              ':',
                              style: subTextStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${widget.carRental.insurance}',
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
                            Text('Pollution Upto', style: textStyle),
                            SizedBox(
                              width: 87,
                            ),
                             Text(
                              ':',
                              style: subTextStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${widget.carRental.pollution}',
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
                            Text('Amount of the car',
                                style: textStyle),
                           SizedBox(
                              width: 59.5,
                            ),
                             Text(
                              ':',
                              style: subTextStyle,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Icon(
                              Icons.currency_rupee,
                              size: 16,
                            ),
                            Text(
                              '${widget.carRental.amount}',
                              style: subTextStyle,
                            ),
                            Text('/-')
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Divider(),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),
                // Buttons>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 27, right: 27),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blueGrey[900]),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Editing_Page(
                                      carRental: widget.carRental)));
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.blueGrey[900])),
                          ),
                        ),
                        
                        Container(
                          width: 140,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blueGrey[900]),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Selected_Car(
                                      carRental: widget.carRental)));
                            },
                            child: Text(
                              'Select',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.blueGrey[900])),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(value, index) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Text('Delete'),
                Text(
                  ' !',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            content: Text(
              'Press OK for delete',
              style: TextStyle(fontSize: 15),
            ),
            actions: [
              Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child:
                        Text('Cancel', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey[900]),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // deleteCar(value[index].id!);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Bottom_Navigation()));
                    },
                    child: Text('OK', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey[900]),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
