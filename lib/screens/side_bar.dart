import 'package:car_rental/screens/login_page.dart';
import 'package:flutter/material.dart';

class Side_bar extends StatelessWidget {
  const Side_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
      UserAccountsDrawerHeader(accountName: Text('Username',style: TextStyle(fontSize: 25),), accountEmail:Text('username@gmail.com'),
      decoration: BoxDecoration(color: Colors.blueGrey[900]), ),
      ListTile(
        title: Text('History of cars'),
        leading: Icon(Icons.history),
        splashColor: Colors.black12,
        onTap: () {
          
        },
      ),
      ListTile(
        title: Text('Revenue'),
        splashColor: Colors.black12,
        leading: Icon(Icons.currency_rupee_outlined),
        onTap: () {
          
        },
      ),
      ListTile(
        title: Text('settings'),
        splashColor: Colors.black12,
        leading: Icon(Icons.settings),
        onTap: () {
          
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
                     actions: [ElevatedButton(onPressed: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login_screen()), (route) => false);
                     }, child: Text('OK',style: TextStyle(color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey[900]),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),)],
                  );
          });
          
        },
      ),
      
      ],
      ),
      
    );
  }
}