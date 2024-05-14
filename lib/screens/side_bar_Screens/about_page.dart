import 'package:flutter/material.dart';

class About_Page extends StatelessWidget {
  const About_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'About Us',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Welcome to EasyRent,',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '''Your go-to destination for hassle-free car rentals! Whether you're planning a weekend getaway or need a reliable ride for your daily commute, we've got you covered. At EasyRent, we strive to make renting a car as simple as possible, offering a seamless experience from start to finish.
          
          With our user-friendly app, finding the perfect vehicle is just a few taps away. Browse through our wide selection of cars, from compact sedans to spacious SUVs, and choose the one that suits your needs and preferences. Our transparent pricing ensures that you always know exactly what you're paying for, with no hidden fees or surprises.
          
          Booking with EasyRent is quick and convenient. Simply select your desired pickup location, choose your dates, and reserve your car in seconds. Need to make changes to your reservation? No problem! Our flexible booking system allows you to modify or cancel your reservation with ease.
          
          Safety and reliability are our top priorities at EasyRent. Rest assured that all of our vehicles undergo rigorous inspections to ensure they meet the highest standards of quality and safety. Plus, our dedicated customer support team is always here to assist you, should you have any questions or concerns.
          
          Experience the convenience of renting a car with EasyRent. Download our app today and hit the road with confidence!'''),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
