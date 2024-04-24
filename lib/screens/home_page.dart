import 'dart:io';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/car_details.dart';
import 'package:car_rental/screens/side_bar.dart';
import 'package:car_rental/db_helper/carrental_service.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_Screen> {

// final _search_controller = TextEditingController();

  final CarrentalService _carrentalsevice = CarrentalService();

  List<CarRental> _list = [];

// String reg= '';


  // search filter

  //  void _runFilter(String enteredKeyword) {
  //   List<carrental> result = [];
  //   if (enteredKeyword.isEmpty) {
  //     result = _list;
  //     // Reset to the original list if the search is empty
  //   } else {
  //     // Filter based on student properties
  //     result = _list
  //         .where((car) =>
  //             car.car
  //                 .toLowerCase()
  //                 .contains(enteredKeyword.toLowerCase()) ||
  //             car.brand
  //                 .toLowerCase()
  //                 .contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //   }
  //   setState(() {
  //     _list = result;
  //   });
  // }


  // fetching all datas from bd

  Future<void> _loaddetails ()async{
    _list = await _carrentalsevice.getDetails();

    setState(() {
      
    });
  }

  @override
  void initState() {
    _loaddetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(120), child: AppBar(
        backgroundColor: Colors.blueGrey[900],
        iconTheme: IconThemeData(color: Colors.white),
        actions: [SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Splash_screen())));
              
            }, icon: Icon(Icons.notifications,color: Colors.white,size:25 ,)),
          )
        )],
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
        bottom: PreferredSize(preferredSize: Size.fromHeight(140), child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(height: 45,width: 250,
                child: 
                TextFormField(

                  // controller: _search_controller,
                 
                  style: TextStyle(color: Colors.white),
                  // onChanged: (value) {
                  //   setState(() {
                  //     _runFilter(value);
                  //     reg = _search_controller.text;
                  //   });
                  // },
                          decoration: InputDecoration(
                            labelText: 'Search',
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: Icon(Icons.search, color: Colors.white),
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                ),
              ),
              SizedBox(width: 15,),
              ElevatedButton(onPressed: (){}, child: Icon(Icons.filter_alt_outlined,color: Colors.white,),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white24),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))))
            ],
          ),
        ),
      ),
      )
    ),

    // drawer>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    drawer: Side_Bar(),


    body:Container(
      
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: _list.isEmpty
            ? Center(
                child: Text("No avialable cars"),
              )
            : ListView.builder(

                itemCount: _list.length,
                itemBuilder: (context, index) {
                  final info = _list[index];
                  return Container(
                    height: 125,
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      // elevation: 30.0,
                                    shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                                    ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 22,),
                        child: ListTile(
                        leading: SizedBox(
                            height: 200, 
                            width: 120,  
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.file(
                                  File(info.imagex),
                                   fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title:Padding(
                            padding: const EdgeInsets.only(top: 8,),
                            child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start, 
                                    crossAxisAlignment: CrossAxisAlignment.start, 
                                    children: [
                                          Text(
                                            "Car Name: ${info.car}",
                                            textAlign: TextAlign.start,
                                             
                                          ),
                                          Text(
                                            "Brand: ${info.brand}",
                                            textAlign: TextAlign.start, 
                                             
                                          ),
                                          Text(
                                            "Model: ${info.model}",
                                            textAlign: TextAlign.start, 
                                             
                                          ),
                                        ],
                                        ),
                          ),
                          // subtitle: Column(
                          //   children: [
                          //     Text("Brand :${info.brand}",),
                          //     Text("Model :${info.model}")
                          //   ],
                          // ),
                                            //     trailing: Container(
                                            //        width: 50,
                                            //       child: Row(
                                            //         children: [
                                            //           IconButton(
                                            //               onPressed: () async {
                                            //                  await _carrentalsevice.deleteDetails(index);
                                            
                                            //                 _loaddetails();
                                            //               },
                                            //               icon: Icon(
                                            //                 Icons.delete,
                                            //                 color: Colors.blueGrey[900],
                                            //               ))
                                            //         ],
                        
                                            //   ), 
                                            // ),
                                            onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Car_Details()));
                                            
                                            },
                                            ),
                      )
                    ),
                  );
                }),
      ),
    );
  }
}