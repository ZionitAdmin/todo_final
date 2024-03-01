import 'package:todo_practica_final/model/registro_model.dart';

abstract class RegistroRepo {
  Future<void> guardarDatosDeRegistro(RegistroData data);
  Future<bool> veridicarCredenciales(String correo, String contrasena);
}
