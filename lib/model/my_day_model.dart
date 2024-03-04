import 'package:isar/isar.dart';

part 'my_day_model.g.dart';

@Collection()
class Tarjeta {
  Id? isarId;
  late final String titulo;
  late final String descripcion;
  final DateTime fechaLimite;
  final DateTime fechaRealizacion;
  final List<String> integrantes;
  final List<String> proyectos;

  Tarjeta({
    this.isarId,
    required this.titulo,
    required this.descripcion,
    required this.fechaLimite,
    required this.fechaRealizacion,
    required this.integrantes,
    required this.proyectos,
  });
}

