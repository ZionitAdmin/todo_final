import 'package:isar/isar.dart';

part 'task_model.g.dart';

enum TaskStatus { pending, finished, inWork }

@Collection()
class Task {
  Id? isarId;
  late final String titulo;
  late final String descripcion;
  late final DateTime fechaLimite;
  final DateTime fechaRealizacion;
  final List<String> integrantes;
  late final String proyectos;
  final bool esImportante;
  @enumerated
  final TaskStatus taskStatus;

  Task({
    this.isarId,
    required this.titulo,
    required this.descripcion,
    required this.fechaLimite,
    required this.fechaRealizacion,
    required this.proyectos ,
    this.esImportante = false,
    this.taskStatus = TaskStatus.pending,
    this.integrantes = const [],

  });
}
