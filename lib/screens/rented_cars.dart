import 'package:flutter/material.dart';

class Rented_Cars extends StatelessWidget {
  const Rented_Cars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.blueGrey[900],
            iconTheme: IconThemeData(color: Colors.white),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(90),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 45,
                      width: 250,
                      child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Search',
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: Icon(Icons.search, color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          )),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white24),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))))
                  ],
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
