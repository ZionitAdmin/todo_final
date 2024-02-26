import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_practica_final/model/prueba_model.dart';

class IsarDBService {
  late Isar _isar;

  Future<void> initIsar() async {
    final directory = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        PruebaSchema, // Agrega aquí los esquemas que necesites
      ],
      directory: directory.path,
    );
  }

  Future<Isar> openDB() async {
    if (_isar == null) {
      await initIsar();
    }
    return _isar;
  }
}

