import 'package:isar/isar.dart';

part 'prueba_model.g.dart';

@collection
class Prueba {
  Id? isarId; // llave primaria autoincrementable

  String dato;

  Prueba({this.isarId, required this.dato});
}
