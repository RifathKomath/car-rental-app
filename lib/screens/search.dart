import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search_screen extends StatefulWidget {
  const Search_screen({super.key});

  @override
  State<Search_screen> createState() => _Search_screenState();
}

class _Search_screenState extends State<Search_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: PreferredSize(preferredSize: Size.fromHeight(100), child: AppBar(
        backgroundColor: Colors.blueGrey[900],
       iconTheme: IconThemeData(color: Colors.white),
       
        bottom: PreferredSize(preferredSize: Size.fromHeight(90), child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(height: 45,width: 250,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Search',
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: Icon(Icons.search, color: Colors.white),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                )),
              ),
              SizedBox(width: 15,),
              ElevatedButton(onPressed: (){}, child: Icon(Icons.filter_alt_outlined,color: Colors.white,),style:ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white24),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))))
            ],
          ),
        ),
      ),
      )
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
         
        ],
      ),
    ),
    );
  }
}