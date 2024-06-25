import 'dart:io';

import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/car_details.dart';
import 'package:car_rental/screens/filter_page.dart';
import 'package:car_rental/screens/side_bar.dart';
import 'package:car_rental/screens/side_bar_screens/history_details.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {

  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _History_PageState();
}

class _History_PageState extends State<HistoryPage> {
    late TextEditingController searchController;
  final CarRentalService _carRentalService = CarRentalService();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _loadDetails();
  }

  Future<void> _loadDetails() async {
    await _carRentalService.updateValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('History of the cars',style: TextStyle(color: Colors.white),),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                // SizedBox(width: 0,),
               
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 324,
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
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: ValueListenableBuilder<List<CarRental>>(
          valueListenable: CarRentalService.carListNotifier,
          builder: (context, value, child) {
            return value.isEmpty
                ? Center(
                    child: Text("No available cars"),
                  )
                : ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (context) => historyDetailPage(carRental: value[index],)))
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
                                  width: 140,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.file(
                                        File(value[index].imagex),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name: ${value[index].car}",
                                        style: TextStyle(fontSize: 14),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        "Brand: ${value[index].brand}",
                                        style: TextStyle(fontSize: 14),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        "Model: ${value[index].model}",
                                        style: TextStyle(fontSize: 14),
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
                  );
          },
        ),
      ),
    );
  }
}
