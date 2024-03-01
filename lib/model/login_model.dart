import 'package:isar/isar.dart';

part 'login_model.g.dart';

@Collection()
class LoginData {
  Id? isarId;
  String email;
  String password;

  LoginData({
    this.isarId,
    required this.email,
    required this.password,
  });
}
