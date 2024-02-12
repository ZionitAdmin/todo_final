import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_practica_final/model/prueba_model.dart';

class IsarDBService {
  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return Isar.openSync([
        PruebaSchema // schema de prueba para modo de ejemplo, sacar una vez comenzado el desarrollo
      ], inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }
}
