import 'package:todo_practica_final/db/interfaces/my_day_repo.dart';
import 'package:todo_practica_final/model/my_day_model.dart';
import 'package:todo_practica_final/services/db_isar_service.dart';
import 'package:isar/isar.dart';

class MiDiaRepoImpl implements MiDiaRepo {
  late Future<Isar> db;

  MiDiaRepoImpl() {
    initDB(); // Llama al método initDB en el constructor
  }

  Future<void> initDB() async {
    final isarService = IsarDBService();
    db = isarService.openDB();
    await db; // Espera a que la inicialización de la base de datos se complete
  }

  @override
  Future<void> guardarDatosDeMiDia(Tarjeta data) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tarjetas.put(data);
    });
  }
  @override
  Future<List<Tarjeta>> obtenerTarjetas() async {
    final isar = await db;
    // Obtener un IsarQuery directamente desde la colección
    final query = isar.tarjetas.where().findAll();
    // Ejecutar la consulta y obtener la lista de tarjetas
    return query;
  }



  @override
  Future<void> actualizarTarjeta(Tarjeta data) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tarjetas.put(data);
    });
  }
}
