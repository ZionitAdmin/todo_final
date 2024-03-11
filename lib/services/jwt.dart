import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:todo_practica_final/config/environment.dart';
import 'package:todo_practica_final/config/errors/errors.dart';

class Jwt {
  static String sign(Map<String, dynamic> payload) {
    final jwt = JWT(payload);
    final token = jwt.sign(SecretKey(Environment.tokenKey));
    return token;
  }

  static Map<String, dynamic> verify(String token) {
    try {
      final jwt = JWT.verify(token, SecretKey(Environment.tokenKey));
      return jwt.payload;
    } on JWTExpiredException {
      throw CustomError('Token expirado');
    } on JWTException catch (e) {
      throw CustomError('Error inesperado al validar token $e');
    }
  }
}
