import 'dart:io';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/bottom_navigation.dart';
import 'package:car_rental/screens/total_balance.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/material.dart';

class RentedCarDetails extends StatefulWidget {
  CarRental carRental;
  RentedCarDetails({super.key, required this.carRental});

  @override
  State<RentedCarDetails> createState() => _Rented_Car_DetailsState();
}

class _Rented_Car_DetailsState extends State<RentedCarDetails> {
  final CarRentalService _carRentalService = CarRentalService();
  final textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    List<File> selectedImag = [];

  final subTextStyle = TextStyle(fontSize: 16);

  final historyOfCars = TextEditingController();

  final formkey = GlobalKey<FormState>();

  final _formkey = GlobalKey<FormState>();
  final balance = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 20,)
                            
                            ],
                          ),
                          Text(
                            'Drop off date : ${widget.carRental.dropOffDate}',
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                          SizedBox(
                            height: 13,
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
                                    fontWeight: FontWeight.bold, fontSize: 16),
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
                              TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext) {
                                          return AlertDialog(
                                            title: Text('Enter current Km'),
                                            content: Form(
                                              key: _formkey,
                                              child: TextFormField(
                                                controller: balance,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5))),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please fill the field';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(context);
                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors
                                                                .blueGrey[900]),
                                                    shape: MaterialStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)))),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  if (balance.text.isNotEmpty) {
                                                    _formkey.currentState!
                                                        .validate();
                                                    validatin();
                                                  } else {
                                                    _formkey.currentState!
                                                        .validate();

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                          backgroundColor:
                                                              Colors.black,
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                          content: Text(
                                                              'Please fill the fields')),
                                                    );
                                                  }
                                                },
                                                child: Text(
                                                  'Ok',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors
                                                                .blueGrey[900]),
                                                    shape: MaterialStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)))),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: Text(
                                    'Tap to see',
                                    style: TextStyle(color: Colors.green),
                                  ))
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
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'Notes :',
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
                                              '${widget.carRental.notes}',
                                              style: subTextStyle,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
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
                                    hintText: 'Please add history of the car'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please provide the history of this car';
                                  } else {
                                    return null;
                                  }
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
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
                                      if (historyOfCars.text.isNotEmpty) {
                                        validating();
                                      } else {
                                        formkey.currentState!.validate();

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              backgroundColor: Colors.black,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              margin: EdgeInsets.all(10),
                                              content: Text(
                                                  'Please fill the fields')),
                                        );
                                      }
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
                        File(widget.carRental.image2),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15,top: 20),
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
                                    width: 1,
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
                                    width: 7,
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
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  'For call , tap on the mobile number',
                                  // style: TextStyle(color: Colors.yellow),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 15),
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
                                    width: 60,
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

  Future<void> validating() async {
    if (formkey.currentState!.validate()) {
      final history = historyOfCars.text.trim();

      final carSelected = CarRental(
          imagex: widget.carRental.imagex,
          car: widget.carRental.car,
          brand: widget.carRental.brand,
          model: widget.carRental.model,
          fuel: widget.carRental.fuel,
          seat: widget.carRental.seat,
          number: widget.carRental.number,
          insurance: widget.carRental.insurance,
          pollution: widget.carRental.pollution,
          amount: widget.carRental.amount,
          pickUpDate: widget.carRental.pickUpDate,
          dropOffDate: widget.carRental.dropOffDate,
          notes: widget.carRental.notes,
          currentKm: widget.carRental.currentKm,
          advanceAmount: widget.carRental.advanceAmount,
          customerName: widget.carRental.customerName,
          mobileNumber: widget.carRental.mobileNumber,
          address: widget.carRental.address,
          status: true,
          id: widget.carRental.id,
          history: history);
      print('validation finished');
      _carRentalService.editDetails(carSelected);


      print('code finished');

      historyOfCars.clear();
      print('object');

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BottomNavigation(
                currentPage: 2,
              )));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            content: Text('Successfully added')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            content: Text('Please fill the fields')),
      );
    }
  }

  Future<void> validatin() async {
    if (_formkey.currentState!.validate()) {
      final km = balance.text.trim();

      final carSelect = CarRental(
          imagex: widget.carRental.imagex,
          car: widget.carRental.car,
          brand: widget.carRental.brand,
          model: widget.carRental.model,
          fuel: widget.carRental.fuel,
          seat: widget.carRental.seat,
          number: widget.carRental.number,
          insurance: widget.carRental.insurance,
          pollution: widget.carRental.pollution,
          amount: widget.carRental.amount,
          pickUpDate: widget.carRental.pickUpDate,
          dropOffDate: widget.carRental.dropOffDate,
          notes: widget.carRental.notes,
          currentKm: widget.carRental.currentKm,
          advanceAmount: widget.carRental.advanceAmount,
          customerName: widget.carRental.customerName,
          mobileNumber: widget.carRental.mobileNumber,
          address: widget.carRental.address,
          status: true,
          id: widget.carRental.id,
          drivenKm: km);
      print('validation finished');

      _carRentalService.editDetails(carSelect);

      print('code finished');

      balance.clear();

      print('object');

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => TotalBalance(carRental: carSelect)));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            content: Text('Successfully added')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            content: Text('Please fill the fields')),
      );
    }
  }
}
