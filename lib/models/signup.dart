
import 'package:hive_flutter/adapters.dart';

part 'signup.g.dart';

@HiveType(typeId: 1)
class signup extends HiveObject{
 
 @HiveField(0)
 late String username;

 @HiveField(1)
 late String emailid;

 @HiveField(2)
 late String passoword;

signup ({

  required this.username,
  required this.emailid,
  required this.passoword
});

  registerUser(signup user) {}
}