import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../model/registro_model.dart';

class RegistroService {
  late Isar _isar;

  Future<void> initIsar() async {
    final directory = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(directory.path as List<CollectionSchema>, directory: '');
  }

  Future<void> guardarDatosDeRegistro(RegistroData registroData) async {
    await _isar.writeTxn((isar) async {
      await isar.registroDatas.put(registroData);
    } as Future Function());
  }
}
