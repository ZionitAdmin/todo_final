import '../../model/task_model.dart';

abstract class TaskRepo {
  Future<List<Task>> obtenerTarjetas();
  Future<void> guardarTarjeta(Task task);
  Future<void> actualizarTarjeta(Task task);
}
