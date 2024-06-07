import 'package:car_rental/models/signup.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';


ValueNotifier<Signup?> currentUserNotifier = ValueNotifier(null);

class SignupService with ChangeNotifier {
  Box<Signup>? _userbox;

  Future<void> openBox() async {
    _userbox = await Hive.openBox('users');
  }

  Future<bool> registerUser(Signup user) async {
    if (_userbox == null) {
      await openBox();
    }
    await _userbox!.add(user);
    notifyListeners();
    print('success');
    
    return true;
  }

  Future<Signup?> loginUser(String username, String password) async {
    if (_userbox == null) {
      await openBox();
    }

    for (var user in _userbox!.values) {
      if (user.username == username && user.password == password) {
        currentUserNotifier.value = user; // Set the current logged-in user
        return user;
      }
    }

    return null;
  }



  Future<List<Signup>> getDetails() async {
    if (_userbox == null) {
      await openBox();
    }
    return _userbox!.values.toList();
  }
}
