import 'package:isar/isar.dart';

part 'user_model.g.dart';

@collection
class User {
  Id? isarId;
  final String nombre;
  final String apellido;
  final DateTime fechaNacimiento;
  final String correo;
  final String contrasena;

  User({
    this.isarId,
    required this.nombre,
    required this.apellido,
    required this.fechaNacimiento,
    required this.correo,
    required this.contrasena,
  });

  String getUserName() =>
      "${nombre.substring(1, 2)}${apellido.substring(1, 2)}";
}
