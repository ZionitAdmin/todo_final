import 'package:isar/isar.dart';

part 'project_model.g.dart';

@Collection()
class Project {
  Id? isarId;
  String name;
  String abbreviation;
  String creator;
  String assignedUser;

  Project({
    this.isarId,
    required this.name,
    required String abbreviation,
    required this.creator,
    required this.assignedUser,
  }) : abbreviation =
            abbreviation.isNotEmpty ? abbreviation : name.substring(0, 3);

  void assignUser(String user) {
    assignedUser = user;
  }
}
