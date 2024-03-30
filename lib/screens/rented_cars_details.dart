import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Rented_car_details extends StatelessWidget {
  const Rented_car_details({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child:
    Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.black,
        title: Text('Rented Cars',style: TextStyle(color: Colors.white,fontSize: 23),),
        centerTitle: true,

      ),
      body: Column(children: [
          TabBar(tabs: [
          Tab(text:'Car details',
          ),
          Tab(text: 'Customer details',)
        ],
        labelColor: Colors.lightGreen[400],
        unselectedLabelColor: Colors.black,
        ),
        Expanded(
          child: TabBarView(children: [
            Container(
              child: Column(
                children: [
                  Text('hello world'),
                ],
              ),
            ),
            Column(
              children: [
                Text('print world')
              ],
            )
          ],
          ),
        ),
      ],
        
      ),
      )
    );
  }
}