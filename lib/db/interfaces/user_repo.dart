import 'package:todo_practica_final/model/user_model.dart';

abstract class UserRepo {
  Future<void> guardarUsuario(User data);
  Future<User?> verificarCredenciales(String correo, String contrasena);
  Future<User?> obtenerUsuarioPorId(int id);
}
