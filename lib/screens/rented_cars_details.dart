
import 'package:car_rental/models/selected_car.dart';
import 'package:car_rental/models/selected_car.dart';
import 'package:car_rental/models/selected_car.dart';
import 'package:car_rental/models/selected_car.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Rented_Car_Details extends StatefulWidget {

  Rented_Car_Details({super.key});

  @override
  State<Rented_Car_Details> createState() => _Rented_Car_DetailsState();
}

class _Rented_Car_DetailsState extends State<Rented_Car_Details> {
  final textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  final subTextStyle = TextStyle(fontSize: 16);

  final historyOfCars = TextEditingController();

  final formkey = GlobalKey<FormState>();

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
                                'Reg_Number',
                                style: textStyle,
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Text(
                                ':',
                                style: subTextStyle,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'null',
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
                                'Amount/Month',
                                style: textStyle,
                              ),
                              SizedBox(
                                width: 63,
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
                                'null',
                                style: subTextStyle,
                              ),
                              SizedBox(
                                width: 5,
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
                                'null',
                                style: subTextStyle,
                              ),
                              SizedBox(
                                width: 5,
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
                              SizedBox(
                                width: 5,
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

                            child: Card(
                                color: Colors.white,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Notes :',
                                            style: textStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'null',
                                          style: subTextStyle,
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Form(
                              key: formkey,
                              child: TextFormField(
                                  controller: historyOfCars,
                                  decoration: InputDecoration(
                                      label: Text('History of the car'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
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
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 170,
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

                          Container(
                               height: 170,
                  width: 290,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              )),

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
                                    width: 56,
                                  ),
                                  Text(
                                    ':',
                                    style: subTextStyle,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'null',
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
                                    width: 62,
                                  ),
                                  Text(
                                    ':',
                                    style: subTextStyle,
                                  ),

                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'null',
                                    style: subTextStyle,
                                  )
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
                                    'Address',
                                    style: textStyle,
                                  ),
                                  SizedBox(
                                    width: 115,
                                  ),
                                  Text(
                                    ':',
                                    style: subTextStyle,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'null',
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
