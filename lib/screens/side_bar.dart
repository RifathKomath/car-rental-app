import 'package:car_rental/screens/side_bar_Screens/about_page.dart';
import 'package:car_rental/screens/login_page.dart';
import 'package:car_rental/screens/side_bar_Screens/contact_page.dart';
import 'package:car_rental/screens/side_bar_Screens/history_page.dart';
import 'package:car_rental/screens/side_bar_Screens/privacy_page.dart';
import 'package:car_rental/screens/side_bar_Screens/revenue_page.dart';
import 'package:car_rental/screens/side_bar_screens/terms_page.dart';
import 'package:flutter/material.dart';

class Side_Bar extends StatelessWidget {
  const Side_Bar({super.key});

  @override
  Widget build(BuildContext context) {
      return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
      UserAccountsDrawerHeader(accountName: Text('Username',style: TextStyle(fontSize: 25),), accountEmail:null,
      decoration: BoxDecoration(color: Colors.blueGrey[900]), ),
      
      ListTile(
        title: Text('About Us'),
        splashColor: Colors.black12,
        leading: Icon(Icons.note),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>About_Page()));
        },
      ),
      ListTile(
        title: Text('History of cars'),
        leading: Icon(Icons.history),
        splashColor: Colors.black12,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>History_Page()));
          
        },
      ),
     ListTile(
        title: Text('Revenue'),
        splashColor: Colors.black12,
        leading: Icon(Icons.currency_rupee_outlined),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Revenue_Page()));
        },
      ),
      ListTile(
        title: Text('Privacy Policy'),
        splashColor: Colors.black12,
        leading: Icon(Icons.privacy_tip_outlined),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Privacy_Page()));
          
        },
      ),
      ListTile(
        title: Text('Terms&Conditions'),
        leading: Icon(Icons.history),
        splashColor: Colors.black12,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Terms_Condtions_Screen()));
          
        },
      ),
      ListTile(
        title: Text('Contact Us'),
        splashColor: Colors.black12,
        leading: Icon(Icons.call),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Contact_Page()));
        },
      ),ListTile(
        title: Text('Logout'),
        leading: Icon(Icons.logout),
        splashColor: Colors.black12,
        onTap: () {
          showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('Logout'),
                    content: Text('Press OK for Logout',style: TextStyle(fontSize: 15),),
                     actions: [
                      ElevatedButton(onPressed: (){                               
                        Navigator.pop(context);
                        }, child: Text('Cancel',style: TextStyle(color: Colors.white,fontSize: 18)),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.
                       grey[900]),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),),  

                      ElevatedButton(onPressed: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login_Screen()), (route) => false);
                     }, child: Text('OK',style: TextStyle(color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.
                     grey[900]),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),),
                     
                   ],
                     
                  );
          });
          
        },
      ),
      
      ],
      ),
      
    );
  }
}