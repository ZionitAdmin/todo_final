import 'package:flutter/foundation.dart';
import '../services/registro_service.dart';


class LoginProvider extends ChangeNotifier {
  final RegistroService _registroService;

  LoginProvider(this._registroService);

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

  Future<bool> login() async {
    return await _registroService.verificarCredenciales(_email, _password);
  }
}
