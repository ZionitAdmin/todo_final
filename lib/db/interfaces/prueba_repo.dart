import 'package:isar/isar.dart';
import 'package:todo_practica_final/model/prueba_model.dart';

abstract class PruebaRepo {
  Future<void> put(Prueba prueba);
  Future<List<Prueba>> getAll();
  Future<Prueba?> getById(Id id);
}
