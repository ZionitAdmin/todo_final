import 'package:isar/isar.dart';

part 'task_model.g.dart';

@Collection()
class Task {
  Id? isarId;
  late final String titulo;
  late final String descripcion;
  late final DateTime fechaLimite;
  final DateTime fechaRealizacion;
  final List<String> integrantes;
  late final List<String> proyectos;

  Task({
    this.isarId,
    required this.titulo,
    required this.descripcion,
    required this.fechaLimite,
    required this.fechaRealizacion,
    required this.integrantes,
    required this.proyectos,
  });
}
