import 'package:flutter/material.dart';
import 'package:todo_practica_final/model/task_model.dart';

class ImportantTasksProvider extends ChangeNotifier {
  final List<Task> _importantTasks = [];

  List<Task> get importantTasks => _importantTasks;

  void addTask(Task task) {
    _importantTasks.add(task);
    notifyListeners();
  }
}
