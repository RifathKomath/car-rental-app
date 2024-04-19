import 'package:car_rental/db_helper/signup_service.dart';
import 'package:car_rental/models/signup.dart';
import 'package:car_rental/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Signup_screen extends StatefulWidget {
  const Signup_screen({super.key});

  @override
  State<Signup_screen> createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {

  final _signupuser = TextEditingController();
  final _signupemail = TextEditingController();
  final _signuppassword = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final Signupservice = Provider.of<signupservice>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.blueGrey[900],
      ),

        body:SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.only(left: 30,top: 80),
            child: Row(
              children: [
                Container(
                  width: 300,
                  height: 520,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all()
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 20),
                      child: Row(
                        children: [
                          Text('Sign Up',style: TextStyle(color: Colors.black,fontSize: 23),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Divider(),
                    ),
                   
                  SizedBox(height: 20,),

                  // username>>>>>>>>>>>>>>>>>>>>>>>
                              
                   Padding(
                     padding: const EdgeInsets.only(left: 15,right: 15),
                     child: TextFormField(
                      controller: _signupuser,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        label: Text('User name:'),
                        labelStyle: TextStyle(color: Colors.black,fontSize: 13)
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter the Username';
                        }else{
                          return null;
                        }
                      },
                     ),
                   ),
          
                  // email>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                   Padding(
                     padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                     child: TextFormField(
                      controller: _signupemail,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        label: Text('Email:'),
                        labelStyle: TextStyle(color: Colors.black,fontSize: 13)
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter the Email';
                        }else{
                          return null;
                        }
                      },
                     ),
                   ),
                                             
                    // password>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                     Padding(
                     padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                     child: TextFormField(
                      controller: _signuppassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        label: Text('Password:'),
                        labelStyle: TextStyle(color: Colors.black,fontSize: 13),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter the Password';
                        }else{
                          return null;
                        }
                      },
                     ),  
                   ),
                              
                   SizedBox(height: 25),

                  //  button>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              
                   ElevatedButton(onPressed: ()async{

                    if(_formkey.currentState!.validate()){
                        showDialog(context: context,
                        barrierDismissible: false,
                         builder: (context){
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                         });

                         signup user = signup(username: _signupuser.text.trim(),
                          emailid: _signupemail.text.trim(),
                           passoword: _signuppassword.text.trim()
                           );

                           final res= await Signupservice.registerUser(user);

                           Navigator.pop(context);

                           if ((res==true)) {

                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor:Colors.black ,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text('Signed up successfully')),);
                            
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login_screen()), (route) => false);
                           }
                    }
                   }, child: Text('Sign Up',style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey[900]),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),),
                              
                    SizedBox(height: 10),
                              
                   Row(
                    children: [
                      SizedBox(width: 47,),
                      Text('Already have Account?'),
                      TextButton(onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login_screen()));
                      }, child: Text('Login'))
                    ],
                   ),
                  ]
                ),
                              ),
              ],
            ),
          ),
        ),
      )
       );
  }

//   void navigateToLoginScreen(BuildContext context) {
//   Future.delayed(Duration(seconds: 2), () {
//     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login_screen()));
//   });
// }
}