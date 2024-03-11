import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';

class PasswordService {
  String encryptPassword(String password) {
    // var salt = _generateSalt();
    // var saltedPassword = utf8.encode(password) + salt;
    // var hashedPassword = sha256.convert(saltedPassword);
    // var result = salt + hashedPassword.bytes;
    // return hex.encode(result);
    return "'";
  }

  bool verifyPassword(String inputPassword, String storedPassword) {
    // var storedBytes = hex.decode(storedPassword);
    // var salt = storedBytes.sublist(0, 16); // Extrae la sal almacenada
    // var inputBytes = utf8.encode(inputPassword) + salt;
    // var hashedInput = sha256.convert(inputBytes).bytes;
    // return const ListEquality().equals(storedBytes, salt + hashedInput);
    return true;
  }

  Uint8List _generateSalt() {
    var random = Random.secure();
    var salt = Uint8List(16);
    for (var i = 0; i < salt.length; i++) {
      salt[i] = random.nextInt(256);
    }
    return salt;
  }
}
