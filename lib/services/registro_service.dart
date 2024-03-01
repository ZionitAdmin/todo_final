import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../model/registro_model.dart';

final _schema = [
  RegistroDataSchema,
];

class RegistroService {
  late Isar _isar;

  Future<void> initIsar() async {
    final directory = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      _schema,
      directory: directory.path,
    );
  }

  Future<void> guardarDatosDeRegistro(RegistroData registroData) async {
    await _ensureIsarInitialized();
    await _isar.writeTxn(() async {
      await _guardarDatosDeRegistro(registroData);
    });
  }

  Future<void> _guardarDatosDeRegistro(RegistroData registroData) async {
    await _isar.registroDatas.put(registroData);
  }

  Future<bool> verificarCredenciales(String correo, String contrasena) async {
    // await _ensureIsarInitialized();
    final registro = await _isar.registroDatas
        .where()
        .filter()
        .correoEqualTo(correo)
        .and()
        .contrasenaEqualTo(contrasena)
        .findFirst();

    return registro != null;
  }

  Future<void> _ensureIsarInitialized() async {}
}
