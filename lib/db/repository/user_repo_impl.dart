import 'package:isar/isar.dart';
import 'package:todo_practica_final/db/interfaces/user_repo.dart';
import 'package:todo_practica_final/model/user_model.dart';
import 'package:todo_practica_final/services/db_isar_service.dart';

class UserRepoImpl implements UserRepo {
  late Future<Isar> db;

  UserRepoImpl() {
    db = IsarDBService().openDB();
  }

  @override
  Future<void> guardarUsuario(User data) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.users.put(data);
    });
  }

  @override
  Future<User?> verificarCredenciales(String correo, String contrasena) async {
    final isar = await db;
    return await isar.users
        .where()
        .filter()
        .correoEqualTo(correo)
        .and()
        .contrasenaEqualTo(contrasena)
        .findFirst();
  }

  @override
  Future<User?> obtenerUsuarioPorId(int id) async {
    final isar = await db;
    return await isar.users.filter().isarIdEqualTo(id).findFirst();
  }
}
