import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Rented_Car_Details extends StatelessWidget {
  Rented_Car_Details({super.key});

  final textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  final subTextStyle = TextStyle(fontSize: 16);

  final historyOfCars = TextEditingController();

  final formkey = GlobalKey<FormState>();

  get context => null;

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
                          Container(
                              width: 250,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              )),
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
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Reg_Number :',
                                style: textStyle,
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
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Amount/Month :',
                                style: textStyle,
                              ),
                              SizedBox(
                                width: 10,
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
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Advance amount paid :',
                                style: textStyle,
                              ),
                              SizedBox(
                                width: 10,
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
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Balance amount :',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
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
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Notes :',
                                style: textStyle,
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
                          Padding(
                            padding: const EdgeInsets.all(20.0),
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
                                width: 140,
                              ),
                              Container(
                                  width: 200,
                                  height: 50,
                                  child: TextButton.icon(
                                    onPressed: () {
                                      formkey.currentState!.validate();
                                    },
                                    icon: Icon(
                                      Icons.check_circle_sharp,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      'Returned car',
                                      style: TextStyle(color: Colors.white),
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
                          )
                        ]),
                      ),
                    ),

                    // Second tab(customer details)>>>>>>>>>>>>>>>>>>>>>>>

                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                              width: 250,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              )),
                          SizedBox(
                            height: 60,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'Customer Name :',
                                    style: textStyle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'null',
                                    style: subTextStyle,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'Mobile Number :',
                                    style: textStyle,
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
                                SizedBox(
                                    height: 20,
                                  ),
                                    Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'Address :',
                                    style: textStyle,
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
