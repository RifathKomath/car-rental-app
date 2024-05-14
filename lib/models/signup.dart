import 'package:hive_flutter/adapters.dart';

part 'signup.g.dart';

@HiveType(typeId: 1)
class Signup extends HiveObject {
  @HiveField(0)
  late String username;

  @HiveField(1)
  late String password;

  @HiveField(2)
  late String confirmpassword;

  Signup(
      {required this.username,
      required this.password,
      required this.confirmpassword});

  registerUser(Signup user) {}
}
