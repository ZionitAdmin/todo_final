
import 'package:isar/isar.dart';
part 'registro_model.g.dart';
// Modelo de datos para el registro
@Collection()
class RegistroData {
  late Id isarId;
  final String nombre;
  final String apellido;
  final DateTime fechaNacimiento;
  final String correo;
  final String contrasena;

  RegistroData({
    required this.nombre,
    required this.apellido,
    required this.fechaNacimiento,
    required this.correo,
    required this.contrasena,
  });
}
