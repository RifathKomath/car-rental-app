import 'package:car_rental/db_helper/signup_service.dart';
import 'package:car_rental/models/signup.dart';
import 'package:car_rental/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_Screen> {

  bool _passwordsecured = true;
  bool _passwordunsecured = true;

  final _signupuser = TextEditingController();
  final _signuppassword = TextEditingController();
  final _confirmppassword = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final signupService = Provider.of<SignupService>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.blueGrey[900],
      ),

        body:SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.only(left: 30,top: 50),
            child: Row(
              children: [
                Container(
                  width: 300,
                  height: 550,
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
          
                                             
                    // password>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                     Padding(
                     padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
                     child: TextFormField(
                      controller: _signuppassword,
                      decoration: InputDecoration(
                        suffixIcon: togglesignPassord(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        label: Text('Password:'),
                        labelStyle: TextStyle(color: Colors.black,fontSize: 13),
                      ),
                      obscureText: _passwordsecured,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter the Password';
                        }else{
                          return null;
                        }
                      },
                     ),  
                   ),

                    Padding(
                     padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
                     child: TextFormField(
                      controller: _confirmppassword,
                      decoration: InputDecoration(
                        suffixIcon: togglesignconfirmPassord(),
                        border: OutlineInputBorder(
                          
                          borderRadius: BorderRadius.circular(25),
                        ),
                        label: Text('Confirm password:'),
                        labelStyle: TextStyle(color: Colors.black,fontSize: 13),
                      ),
                      obscureText: _passwordunsecured,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please confirm the Password';
                        }else{
                          return null;
                        }
                      },
                     ),  
                   ),

                   
                   SizedBox(height: 20,),

                  //  button>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              
                   ElevatedButton(
  onPressed: () async {
    if (_formkey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      // Validate confirmation password
      if (_signuppassword.text.trim() != _confirmppassword.text.trim()) {
        Navigator.pop(context); // Close the dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
            margin: EdgeInsets.all(10),
            content: Text('Passwords do not match'),
          ),
        );
        return; 
      }

      Signup user = Signup(
        username: _signupuser.text.trim(),
        password: _signuppassword.text.trim(),
        confirmpassword: _confirmppassword.text.trim(),
      );

      final res = await signupService.registerUser(user);

      Navigator.pop(context); // Close the dialog

      if (res == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
            margin: EdgeInsets.all(10),
            content: Text('Signed up successfully'),
          ),
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Login_Screen()),
          (route) => false,
        );
      }
    }
  },
  child: Text(
    'Sign Up',
    style: TextStyle(color: Colors.white),
  ),
  style: ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(Colors.grey[900]),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
),

                              
                    SizedBox(height: 10),
                              
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have Account?'),
                      TextButton(onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login_Screen()));
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


 Widget togglesignPassord (){
          return IconButton(onPressed: (){
            setState(() {
               _passwordsecured = !_passwordsecured;
            });
           
          }, icon:_passwordsecured?Icon(Icons.visibility,size: 24,):Icon(Icons.visibility_off,size: 24,),color: Colors.black,);
  }

   Widget togglesignconfirmPassord (){
          return IconButton(onPressed: (){
            setState(() {
              _passwordunsecured = !_passwordunsecured;
            });
           
          }, icon:_passwordunsecured?Icon(Icons.visibility,size: 24,):Icon(Icons.visibility_off,size: 24,),color: Colors.black,);
  }
}