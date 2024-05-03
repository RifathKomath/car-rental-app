import 'dart:io';
import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/car_details.dart';
import 'package:car_rental/screens/filter_page.dart';
import 'package:car_rental/screens/side_bar.dart';
import 'package:car_rental/db_helper/car_rental_service.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_Screen> {

late TextEditingController searchController = TextEditingController();
late List<CarRental> _filteredCars;

  final CarRentalService _carRentalService = CarRentalService();

  List<CarRental> _list = [];
  
  final style = TextStyle(fontSize: 14,);

  // fetching all datas from bd

  Future<void> _loadDetails ()async{
    _list = await _carRentalService.getDetails();
    _filteredCars = List.from(_list); // Initialize filtered cars with all cars
    setState(() {
      
    });
  }

  @override
  void initState() {
    _loadDetails();
    searchController = TextEditingController();
    super.initState();
  }

   void _runFilter(String enteredKeyword) {
    // Filter based on entered keyword
    List<CarRental> result = _list.where((car) =>
        car.car.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
        car.brand.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    setState(() {
      _filteredCars = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(140), child: AppBar(
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
                  controller: searchController,
                 onChanged: (value) {
                        _runFilter(value); // Call filter function on text change
                      },
                  style: TextStyle(color: Colors.white),
                 
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
               ElevatedButton(onPressed: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Filter_Page()));


              }, child: Icon(Icons.filter_alt_outlined,color: Colors.white,),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white24),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))))

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

                itemCount: _filteredCars.length,
                itemBuilder: (context, index) {
                  final info = _filteredCars[index];
                  return Container(
                    // height: 15,
                    child: Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 5.0,
                                    shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)
                                    ),
                      child: ListTile(
                      leading: SizedBox(
                          height: 200, 
                          width: 120,  
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(5),),
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
                          padding: const EdgeInsets.only(top: 8,bottom: 8),
                          child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start, 
                                  crossAxisAlignment: CrossAxisAlignment.start, 
                                  children: [
                                        Text(
                                          "Name: ${info.car}",style: style,
                                          textAlign: TextAlign.start,
                                           
                                        ),
                                        Text(
                                          "Brand: ${info.brand}",style: style,
                                          textAlign: TextAlign.start, 
                                           
                                        ),
                                        Text(
                                          "Model: ${info.model}",style: style,
                                          textAlign: TextAlign.start, 
                                           
                                        ),
                                      ],
                                      ),
                        ),
                                              // trailing: IconButton(
                                                
                                              //   onPressed: () async {
                                              //        await _carRentalService.deleteDetails(index);
                                                                                        
                                              //       _loadDetails();
                                              //     },
                                              //     icon: Icon(
                                              //       Icons.delete,
                                              //       color: Colors.blueGrey[900],
                                              //     )),
                                          onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Car_Details(carRental: _filteredCars[index])));
                                          
                                          },
                                          )
                    ),
                  );
                }),
      ),
    );
  }


}