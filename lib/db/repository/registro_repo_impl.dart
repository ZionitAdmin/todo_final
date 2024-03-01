import 'package:isar/isar.dart';
import 'package:todo_practica_final/db/interfaces/registro_repo.dart';
import 'package:todo_practica_final/model/registro_model.dart';
import 'package:todo_practica_final/services/db_isar_service.dart';

class RegistroRepoImpl implements RegistroRepo {
  late Future<Isar> db;

  RegistroRepoImpl() {
    db = IsarDBService().openDB();
  }

  @override
  Future<void> guardarDatosDeRegistro(RegistroData data) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.registroDatas.put(data);
    });
  }

  @override
  Future<bool> veridicarCredenciales(String correo, String contrasena) async {
    final isar = await db;
    final registro = await isar.registroDatas
        .where()
        .filter()
        .correoEqualTo(correo)
        .and()
        .contrasenaEqualTo(contrasena)
        .findFirst();

    return registro != null;
  }
}
