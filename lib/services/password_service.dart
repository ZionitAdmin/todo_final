import 'dart:convert';
import 'package:crypto/crypto.dart';

class PasswordService {
  String encryptPassword(String password) {
    final saltedPassword = utf8.encode(password);
    final hashedPassword = sha256.convert(saltedPassword);
    return hashedPassword.toString();
  }

  bool verifyPassword(String inputPassword, String storedPassword) {
    final hashedInput = encryptPassword(inputPassword);
    return storedPassword == hashedInput;
  }
}
