import 'dart:io';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Rented_Car_Details extends StatefulWidget {
  CarRental carRental;
  Rented_Car_Details({super.key, required this.carRental});

  @override
  State<Rented_Car_Details> createState() => _Rented_Car_DetailsState();
}

class _Rented_Car_DetailsState extends State<Rented_Car_Details> {
  final CarRentalService _carRentalService = CarRentalService();
  final textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  final subTextStyle = TextStyle(fontSize: 16);

  final historyOfCars = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(widget.carRental.image1);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.blueGrey[900],
            title: Text(
              'Rented Car',
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Car details',
                  ),
                  Tab(
                    text: 'Customer details',
                  )
                ],
                labelColor: Colors.black,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              CarouselSlider(
                                items: widget.carRental.image1
                                        ?.map((image) => Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                  image: FileImage(
                                                    File(image),
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              width: 330,
                                              height: 200,
                                            ))
                                        .toList() ??
                                    [],
                                options: CarouselOptions(
                                  height: 200,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: false,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Expiring in :',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 17),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Car name',
                                style: textStyle,
                              ),
                              SizedBox(
                                width: 105,
                              ),
                              Text(
                                ':',
                                style: subTextStyle,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${widget.carRental.car}',
                                style: subTextStyle,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Brand',
                                style: textStyle,
                              ),
                              SizedBox(
                                width: 132,
                              ),
                              Text(
                                ':',
                                style: subTextStyle,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${widget.carRental.brand}',
                                style: subTextStyle,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Model',
                                style: textStyle,
                              ),
                              SizedBox(
                                width: 129,
                              ),
                              Text(
                                ':',
                                style: subTextStyle,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${widget.carRental.model}',
                                style: subTextStyle,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Fuel type',
                                style: textStyle,
                              ),
                              SizedBox(
                                width: 107,
                              ),
                              Text(
                                ':',
                                style: subTextStyle,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${widget.carRental.fuel}',
                                style: subTextStyle,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Total amount',
                                style: textStyle,
                              ),
                              SizedBox(
                                width: 78,
                              ),
                              Text(
                                ':',
                                style: subTextStyle,
                              ),
                              SizedBox(
                                width: 17,
                              ),
                              Icon(
                                Icons.currency_rupee,
                                size: 16,
                              ),
                              Text(
                                '${widget.carRental.amount}',
                                style: subTextStyle,
                              ),
                              Text(
                                '/-',
                                style: subTextStyle,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Advance amount paid',
                                style: textStyle,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                ':',
                                style: subTextStyle,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.currency_rupee,
                                size: 16,
                              ),
                              Text(
                                '${widget.carRental.advanceAmount}',
                                style: subTextStyle,
                              ),
                              Text(
                                '/-',
                                style: subTextStyle,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Balance amount',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              ),
                              SizedBox(
                                width: 56,
                              ),
                              Text(
                                ':',
                                style: subTextStyle,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.currency_rupee,
                                size: 16,
                                color: Colors.green,
                              ),
                              Text(
                                'null',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              ),
                              Text(
                                '/-',
                                style: subTextStyle,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: double.infinity,
                              child: Card(
                                  color: Colors.white,
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                             top: 10),
                                        child: Text(
                                          'Notes :',
                                          style: textStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${widget.carRental.notes}',
                                              style: subTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20,)
                                    ],
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: Form(
                              key: formkey,
                              child: TextFormField(
                                  controller: historyOfCars,
                                  decoration: InputDecoration(
                                      label: Text('History of the car'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText:
                                          'Please add history of the car'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please provide the history of this car';
                                    } else {
                                      return null;
                                    }
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 187,
                              ),
                              Container(
                                  width: 150,
                                  height: 50,
                                  child: TextButton.icon(
                                    onPressed: () {
                                      formkey.currentState!.validate();
                                    },
                                    label: Text(
                                      'Save',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    icon: Icon(
                                      Icons.check_circle_sharp,
                                      color: Colors.white,
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.blueGrey[900]),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ]),
                      ),
                    ),

                    // Second tab(customer details)>>>>>>>>>>>>>>>>>>>>>>>

                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                              CarouselSlider(
                                items: widget.carRental.image2
                                        ?.map((image) => Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                  image: FileImage(
                                                    File(image),
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              width: 330,
                                              height: 200,
                                            ))
                                        .toList() ??
                                    [],
                                options: CarouselOptions(
                                  height: 200,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: false,
                                ),
                              ),
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'Customer Name',
                                    style: textStyle,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    ':',
                                    style: subTextStyle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${widget.carRental.customerName}',
                                    style: subTextStyle,
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Divider(),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'Mobile Number',
                                    style: textStyle,
                                  ),
                                  SizedBox(
                                    width: 22,
                                  ),
                                  Text(
                                    ':',
                                    style: subTextStyle,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        FlutterPhoneDirectCaller.callNumber(
                                            '${widget.carRental.mobileNumber}');
                                      },
                                      child: Text(
                                          '${widget.carRental.mobileNumber}')),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  'For calling , tap on the mobile number',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15, top: 15),
                                child: Divider(),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'Address',
                                    style: textStyle,
                                  ),
                                  SizedBox(
                                    width: 74,
                                  ),
                                  Text(
                                    ':',
                                    style: subTextStyle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${widget.carRental.address}',
                                    style: subTextStyle,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
