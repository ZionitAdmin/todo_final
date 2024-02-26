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
    await _isar.writeTxn((isar) async {
      await isar.registroDatas.put(registroData);
    } as Future Function());
  }

  Future<bool> verificarCredenciales(String correo, String contrasena) async {
    final registro = await _isar.registroDatas
        .where()
        .filter()
        .correoEqualTo(correo) // Aplicar filtro para correo igual a 'correo'
        .and()
        .contrasenaEqualTo(contrasena) // Aplicar filtro para contraseña igual a 'contrasena'
        .findFirst();

    return registro != null; // Devolver true si se encuentra el registro, false si no
  }
}


