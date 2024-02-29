import 'package:isar/isar.dart';

part 'login_model.g.dart';

@Collection()
class LoginData {


  late Id isarId;
  String email;
  String password;

  LoginData({
    required this.email,
    required this.password,
  });
}