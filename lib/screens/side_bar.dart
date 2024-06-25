import 'package:car_rental/db_helper/signup_service.dart';
// import 'package:car_rental/models/carrental.dart';
// import 'package:car_rental/screens/side_bar_Screens/about_page.dart';
import 'package:car_rental/screens/login_page.dart';
// import 'package:car_rental/screens/side_bar_Screens/contact_page.dart';
// import 'package:car_rental/screens/side_bar_Screens/history_page.dart';
// import 'package:car_rental/screens/side_bar_Screens/privacy_page.dart';
// import 'package:car_rental/screens/side_bar_Screens/revenue_page.dart';
import 'package:car_rental/screens/side_bar_screens/about_page.dart';
import 'package:car_rental/screens/side_bar_screens/contact_page.dart';
import 'package:car_rental/screens/side_bar_screens/history_page.dart';
import 'package:car_rental/screens/side_bar_screens/privacy_page.dart';
import 'package:car_rental/screens/side_bar_screens/revenue_page.dart';
import 'package:car_rental/screens/side_bar_screens/terms_page.dart';
import 'package:flutter/material.dart';
// import 'package:car_rental/models/signup.dart';

class SideBar extends StatelessWidget {

   SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ValueListenableBuilder(
            valueListenable: currentUserNotifier,
            builder: (context, value, child) {
              return UserAccountsDrawerHeader(
                accountName: Text(
                 '${value?.username}',
                  style: TextStyle(fontSize: 25),
                ),
                accountEmail: null,
                decoration: BoxDecoration(color: Colors.blueGrey[900]),
              );
            },
          ),
          ListTile(
            title: Text('About Us'),
            splashColor: Colors.black12,
            leading: Icon(Icons.note),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutPage()));
            },
          ),
          ListTile(
            title: Text('History of cars'),
            leading: Icon(Icons.history),
            splashColor: Colors.black12,
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HistoryPage()));
            },
          ),
          ListTile(
            title: Text('Revenue'),
            splashColor: Colors.black12,
            leading: Icon(Icons.currency_rupee_outlined),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RevenuePage()));
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            splashColor: Colors.black12,
            leading: Icon(Icons.privacy_tip_outlined),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>PrivacyPage()));
            },
          ),
          ListTile(
            title: Text('Terms&Conditions'),
            leading: Icon(Icons.history),
            splashColor: Colors.black12,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TermsCondtionsScreen()));
            },
          ),
          ListTile(
            title: Text('Contact Us'),
            splashColor: Colors.black12,
            leading: Icon(Icons.call),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ContactPage()));
            },
          ),
          ListTile(
            title: Text('Logout', style: TextStyle(color: Colors.red),),
            leading: Icon(Icons.logout, color: Colors.red,),
            splashColor: Colors.black12,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Logout'),
                      content: Text(
                        'Press OK for Logout',
                        style: TextStyle(fontSize: 15),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel',
                              style: TextStyle(color: Colors.blueGrey[900], fontSize: 18)),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            currentUserNotifier.value = null; // Reset current user
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (route) => false);
                          },
                          child: Text('OK', style: TextStyle(color: Colors.white)),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.grey[900]),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ],
                    );
                  });
            },
          ),
          SizedBox(height: 30,),
          Container(
            width: 10,
            height: 30,
            child: Image.asset('assets/easy-rent-high-resolution-logo-transparent (1).png')
          )
        ],
      ),
    );
  }
}
