import 'package:isar/isar.dart';

part 'task_model.g.dart';

enum TaskStatus { pending, finished, inWork }

@Collection()
class Task {
  Id? isarId;
  final String titulo;
  final String descripcion;
  final DateTime fechaLimite;
  final DateTime fechaRealizacion;
  final List<String> integrantes;
  final List<String> proyectos;
  final bool esImportante;
  @enumerated
  final TaskStatus taskStatus;

  Task({
    this.isarId,
    required this.titulo,
    required this.descripcion,
    required this.fechaLimite,
    required this.fechaRealizacion,
    this.esImportante = false,
    this.taskStatus = TaskStatus.pending,
    this.integrantes = const [],
    this.proyectos = const [],
  });
}
