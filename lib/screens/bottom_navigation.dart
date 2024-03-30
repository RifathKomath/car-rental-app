import 'package:car_rental/screens/adding_cars.dart';
import 'package:car_rental/screens/home_page.dart';
import 'package:car_rental/screens/rented_cars.dart';
import 'package:flutter/material.dart';

class Bottom_navigation extends StatefulWidget {
  const Bottom_navigation({super.key});

  @override
  State<Bottom_navigation> createState() => _Bottom_navigationState();
}

class _Bottom_navigationState extends State<Bottom_navigation> {

  int _selectedIndex = 0;
  
  final _Screen = [
      Home_screen(),
      Adding_cars(),
      Rented_cars()


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: _Screen[_selectedIndex],
    ),
    bottomNavigationBar: ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
      child: SizedBox(height: 80,
        child: BottomNavigationBar(backgroundColor: Colors.black,
            items:[
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.lightGreen[400],size: 35,),label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.add,color: Colors.lightGreen[400],size: 35),label: 'Add New Car'),
            BottomNavigationBarItem(icon: Icon(Icons.directions_car_outlined,color: Colors.lightGreen[400],size: 35),label: 'Rented cars')
          ],
          selectedFontSize: 15,
          selectedItemColor: Colors.white,
          showUnselectedLabels: false,
           currentIndex: _selectedIndex, 
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },),
      ),
    ),

    );
  }
}