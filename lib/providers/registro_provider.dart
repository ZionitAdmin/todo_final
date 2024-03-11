import 'package:flutter/material.dart';
import 'package:todo_practica_final/db/interfaces/registro_repo.dart';
import 'package:todo_practica_final/db/repository/registro_repo_impl.dart';
import 'package:todo_practica_final/model/registro_model.dart';
import 'package:todo_practica_final/services/password_service.dart';

class RegisterProvider extends ChangeNotifier {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  DateTime fechaNacimiento = DateTime.now();
  RegistroRepo repo = RegistroRepoImpl();

  final pswService = PasswordService();

  void changeBirthDate(DateTime date) {
    fechaNacimiento = date;
    notifyListeners();
  }

  Future<void> handleSubmit() async {
    final edadActual = DateTime.now().difference(fechaNacimiento).inDays / 365;

    if (edadActual < 18) {
      throw Exception("Debe tener mas de 18 años para registrarse");
    }

    final hashedPassword =
        pswService.encryptPassword(contrasenaController.text);

    RegistroData registro = RegistroData(
      nombre: nombreController.text,
      apellido: apellidoController.text,
      fechaNacimiento: fechaNacimiento,
      correo: correoController.text,
      contrasena: hashedPassword,
    );
    try {
      await repo.guardarDatosDeRegistro(registro);
    } catch (e) {
      throw Exception(
          "Ha ocurrido un error al guardar los datos en la base de datos: $e");
    }
  }
}
