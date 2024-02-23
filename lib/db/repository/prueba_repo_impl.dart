import 'package:isar/isar.dart';
import 'package:todo_practica_final/db/interfaces/prueba_repo.dart';
import 'package:todo_practica_final/model/prueba_model.dart';
import 'package:todo_practica_final/services/db_isar_service.dart';

class PruebaRepoImpl implements PruebaRepo {
  late Future<Isar> _db;

  PruebaRepoImpl() {
    _initializeIsar();
  }

  Future<void> _initializeIsar() async {
    _db = IsarDBService().openDB();
  }

  @override
  Future<List<Prueba>> getAll() async {
    final isar = await _db;
    return await isar.pruebas.where().findAll();
  }

  @override
  Future<Prueba?> getById(Id id) async {
    final isar = await _db;
    return await isar.pruebas.filter().isarIdEqualTo(id).findFirst();
  }

  @override
  Future<void> put(Prueba prueba) async {
    final isar = await _db;

    try {
      await isar.writeTxn(() => isar.pruebas.put(prueba));
    } catch (e) {
      print('Error al guardar la prueba: $e');
      // Maneja el error según corresponda
    }
  }
}

