

  import 'package:isar/isar.dart';
  import 'package:path_provider/path_provider.dart';

import '../model/login_model.dart';
import '../model/project_model.dart';
import '../model/registro_model.dart';

  class IsarDBService {
  late Future<Isar> db;

  IsarDBService() {
  db = openDB();
  }

  Future<Isar> openDB() async {
  final dir = await getApplicationDocumentsDirectory();

  if (Isar.instanceNames.isEmpty) {
  return await Isar.open(
  [
  ProjectSchema,
  RegistroDataSchema,
    LoginDataSchema,
  ],
  directory: dir.path,
  inspector: true,
  );
  }

  return Future.value(Isar.getInstance());
  }
  }
