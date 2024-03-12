import 'package:flutter/foundation.dart';
import 'package:todo_practica_final/db/repository/user_repo_impl.dart';
import 'package:todo_practica_final/model/user_model.dart';
import 'package:todo_practica_final/services/password_service.dart';

class LoginProvider extends ChangeNotifier {
  final registroRepo = UserRepoImpl();

  LoginProvider();

  String _email = '';
  String _password = '';
  bool _isPasswordVisible = false;

  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<User?> login() async {
    final hashedPassword = PasswordService().encryptPassword(_password);

    return await registroRepo.verificarCredenciales(_email, hashedPassword);
  }
}
