import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class ImportantTasksProvider extends ChangeNotifier {
  final List<Task> _importantTasks = [];

  List<Task> get importantTasks => _importantTasks;

  void addTask(Task task) {
    _importantTasks.add(task);
    notifyListeners();
  }
}
