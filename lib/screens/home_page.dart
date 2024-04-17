import 'package:car_rental/models/carrental.dart';
import 'package:car_rental/screens/car_details.dart';
import 'package:car_rental/screens/side_bar.dart';
import 'package:car_rental/db_helper/carrental_service.dart';
import 'package:flutter/material.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {

  final carrentalservice _carrentalsevice = carrentalservice();

  List<carrental> _list = [];


  // fetching all datas for bd

  Future<void> _loaddetails ()async{
    _list = await _carrentalsevice.getdetails();

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
      appBar: PreferredSize(preferredSize: Size.fromHeight(135), child: AppBar(
        backgroundColor: Colors.blueGrey[900],
        iconTheme: IconThemeData(color: Colors.white),
        actions: [SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Car_details())));
              
            }, icon: Icon(Icons.notifications,color: Colors.white,size:25 ,)),
          )
        )],
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
        bottom: PreferredSize(preferredSize: Size.fromHeight(140), child: Padding(
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
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                )),
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

    drawer: Side_bar(),


    body:Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: _list.isEmpty
            ? Center(
                child: Text("No avialable cars"),
              )
            : ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  final info = _list[index];
                  return Card(
                    elevation: 5.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text("${info.car}"),
                      subtitle: Text("${info.brand}"),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                              SizedBox(width: 50,),
                            IconButton(
                                onPressed: () async {
                                   await _carrentalsevice.deletedetails(index);

                                  _loaddetails();
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red[400],
                                ))
                          ],
                    
                    ), 
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Car_details()));
                  },
                  )
                  );
                }),
      ),
    );
  }
}