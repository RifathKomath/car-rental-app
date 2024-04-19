import 'package:car_rental/models/signup.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class signupservice with ChangeNotifier{


  Box<signup>? _userbox;

  Future<void>openBox()async{
    _userbox=await Hive.openBox('users');
  }

  // register user

  Future<bool>registerUser( signup user)async{
    
    if(_userbox==null){
      await openBox();
    }
    await _userbox!.add(user);
    notifyListeners();
    print('success');
    return true;
  }


  Future<signup?>loginUser(String username, String password)async{


    if (_userbox==null){
      await openBox();
    }

    for (var user in _userbox!.values){

      // check email password combination

      if (user.username==username && user.passoword==password){

        return user;
      }
    }
    return null;
  }

 
}