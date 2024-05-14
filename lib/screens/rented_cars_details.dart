import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Rented_Car_Details extends StatelessWidget {
  const Rented_Car_Details({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.blueGrey[900],
            title: Text(
              'Rented Cars',
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
                      child: Column(
                        children: [],
                      ),
                    ),
                    Column(
                      children: [Text('print world')],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
