import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:todo_practica_final/db/interfaces/task_repo.dart';
import 'package:todo_practica_final/db/repository/task_repo_impl.dart';
import 'package:todo_practica_final/model/task_model.dart';
class TaskProvider extends ChangeNotifier {
  final TaskRepo _taskRepo = TaskRepoImpl();
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    _tasks = await _taskRepo.obtenerTarjetas();

  }

  Future<void> addTask(Task task) async {
    await _taskRepo.guardarTarjeta(task);
    await fetchTasks();
  }

  Future<void> updateTask(Task task) async {
    await _taskRepo.actualizarTarjeta(task);
    await fetchTasks();
  }

  Future<void> deleteTask(Id taskId) async {
    await _taskRepo.eliminarTarea(taskId);
    await fetchTasks();
  }
}
