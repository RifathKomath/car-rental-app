import 'package:car_rental/db_helper/signup_service.dart';
import 'package:car_rental/screens/bottom_navigation.dart';
import 'package:car_rental/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_Screen> {

  bool _securePassword = true;

 final _username = TextEditingController();

 final _password = TextEditingController();

 final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    final Signupservice = Provider.of<SignupService>(context);

    return Scaffold(
      appBar: AppBar(
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
                      padding: const EdgeInsets.only(left: 20,top: 30),
                      child: Row(
                        children: [
                          Text('LOGIN',style: TextStyle(color: Colors.black,fontSize: 23),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Divider(),
                    ),
                   
                  SizedBox(height: 20,),

                  // username/Email>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              
                   Padding(
                     padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                     child: TextFormField(
                      controller: _username,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        label: Text('User name'),
                        labelStyle: TextStyle(color: Colors.black,fontSize: 13)
                      ),
                      validator: (value) {
                        if(value==null || value.isEmpty){
                          return 'Please enter the Username';
                        }else{
                              return null;
                        }
                      },
                     ),
                   ),
                              
                    SizedBox(height: 8,),

                    // password>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              
                     Padding(
                     padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
                     child: TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                        suffixIcon: togglePassord(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        label: Text('Password:'),
                        labelStyle: TextStyle(color: Colors.black,fontSize: 13),
                      ),
                      obscureText: _securePassword,
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

                  //  button>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              
                   ElevatedButton(onPressed: ()async{
                      if(_formkey.currentState!.validate()){

                         showDialog(context: context,
                        barrierDismissible: false,
                         builder: (context){
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                         });

                        
                        final user = await Signupservice.loginUser(_username.text.trim(), _password.text.trim());

                                    
                      Navigator.pop(context);
                        if(user!=null){
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Bottom_Navigation()), (route) => false);             

                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
            margin: EdgeInsets.all(10),
            content: Text('Username and password does not match / User not found'),
          ),
        );
                        }
                      }
                    
                   }, child: Text('Log in',style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blueGrey[900]),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),),
                              
                    SizedBox(height: 15),
                              
                   Row(
                    children: [
                      SizedBox(width: 45,),
                      Text('First time here?'),
                      TextButton(onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Signup_Screen()));
                      }, child: Text('Sign up for free'))
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

  Widget togglePassord (){
          return IconButton(onPressed: (){
            setState(() {
               _securePassword = !_securePassword;
            });
           
          }, icon:_securePassword?Icon(Icons.visibility,size: 24,):Icon(Icons.visibility_off,size: 24,),color: Colors.black,);
  }

  
}