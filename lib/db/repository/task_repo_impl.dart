import 'package:todo_practica_final/db/interfaces/task_repo.dart';
import 'package:todo_practica_final/model/task_model.dart';
import 'package:todo_practica_final/services/db_isar_service.dart';
import 'package:isar/isar.dart';

class TaskRepoImpl implements TaskRepo {
  late Future<Isar> db;

  TaskRepoImpl() {
    initDB(); // Llama al método initDB en el constructor
  }

  Future<void> initDB() async {
    final isarService = IsarDBService();
    db = isarService.openDB();
    await db; // Espera a que la inicialización de la base de datos se complete
  }

  @override
  Future<void> guardarTarjeta(Task data) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tasks.put(data);
    });
  }

  @override
  Future<List<Task>> obtenerTarjetas() async {
    final isar = await db;
    final query = isar.tasks.where().findAll();
    return query;
  }

  @override
  Future<void> actualizarTarjeta(Task data) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tasks.put(data);
    });
  }
}
