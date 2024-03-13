import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/db/repository/task_repo_impl.dart';
import 'package:todo_practica_final/model/task_model.dart';
import 'package:todo_practica_final/providers/appbar_provider.dart';
import 'package:go_router/go_router.dart';
import '../config/constants.dart';
import '../widgets/drawer/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.children}) : super(key: key);

  final StatefulNavigationShell children;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task>? tasks;
  final bool _showFloatingButton = true;
  Timer? _timer;
  late Map<int, String> _timeRemaining;
  late Map<int, bool> _timerIsActive;
  late TextEditingController _projectController;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _deadlineController;

  @override
  void initState() {
    super.initState();
    _loadTasks();
    _timeRemaining = {};
    _timerIsActive = {};
    _projectController = TextEditingController();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _deadlineController = TextEditingController();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _projectController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _deadlineController.dispose();
    super.dispose();
  }

  void _loadTasks() async {
    final repo = TaskRepoImpl();
    tasks = await repo.obtenerTarjetas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppConstants.homeScaffoldKey,
      appBar: AppBar(
        title: Consumer<AppbarProvider>(
          builder: (context, appbarProvider, child) {
            return Text(appbarProvider.title);
          },
        ),
      ),
      drawer: const MyDrawer(),
      body: tasks == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: tasks!.length,
              itemBuilder: (context, index) {
                final task = tasks![index];
                final timeRemaining =
                    _getTimeRemaining(index, task.fechaLimite);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Proyecto: ${task.proyectos.join(", ")}'),
                                  const SizedBox(height: 8),
                                  Text('Título: ${task.titulo}'),
                                  const SizedBox(height: 8),
                                  Text('Descripción: ${task.descripcion}'),
                                  const SizedBox(height: 8),
                                  Text(
                                      'Fecha límite: ${task.fechaLimite.toString()}'),
                                  const SizedBox(height: 8),
                                  Text(
                                      'Fecha realización: ${task.fechaRealizacion.toString()}'),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 8, // Mover el contenedor hacia abajo
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(
                                      0.8), // Color de fondo del contenedor
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(_timerIsActive[index] ?? false
                                          ? Icons.pause
                                          : Icons.play_arrow),
                                      onPressed: () =>
                                          _toggleTimer(index, task.fechaLimite),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(_timeRemaining[index] ??
                                        timeRemaining), // Cronómetro
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: PopupMenuButton(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: "edit",
                                child: Text("Editar"),
                              ),
                              const PopupMenuItem(
                                value: "delete",
                                child: Text("Eliminar"),
                              ),
                            ],
                            onSelected: (value) {
                              if (value == "edit") {
                                _editTask(context, index);
                              } else if (value == "delete") {
                                _deleteTask(index);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: _showFloatingButton
          ? FloatingActionButton(
              onPressed: _addRandomTask,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  void _editTask(BuildContext context, int index) {
    final task = tasks![index];
    _projectController.text = task.proyectos.isNotEmpty
        ? task.proyectos.first
        : 'Proyecto ${_randomString(1)}';
    _titleController.text = task.titulo;
    _descriptionController.text = task.descripcion;
    _deadlineController.text = task.fechaLimite.toString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Editar Tarea"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _projectController,
                decoration: const InputDecoration(labelText: 'Proyecto'),
              ),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
              TextField(
                controller: _deadlineController,
                decoration: const InputDecoration(
                    labelText: 'Fecha límite (YYYY-MM-DD)'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  tasks![index].proyectos = [_projectController.text];
                  tasks![index].titulo = _titleController.text;
                  tasks![index].descripcion = _descriptionController.text;
                  tasks![index].fechaLimite =
                      DateTime.parse(_deadlineController.text);
                });

                final repo = TaskRepoImpl();
                await repo.guardarTarjeta(task);

                Navigator.of(context).pop();
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        );
      },
    );
  }

  void _addRandomTask() async {
    final random = Random();
    final project = 'Proyecto ${_randomString(1 + random.nextInt(3))}';
    final title = 'Tarea ${_randomString(5)}';
    final description = 'Descripción de la tarea ${_randomString(10)}';
    final task = Task(
      titulo: title,
      descripcion: description,
      fechaLimite: DateTime.now().add(const Duration(days: 1)),
      fechaRealizacion: DateTime.now(),
      integrantes: ['Usuario1'],
      proyectos: [project],
    );
    final repo = TaskRepoImpl();
    await repo.guardarTarjeta(task);
    setState(() {
      tasks!.add(task);
    });
  }

  String _randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
          length, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }

  String _getTimeRemaining(int index, DateTime deadline) {
    final now = DateTime.now();
    final difference = deadline.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;
    final timeRemaining =
        '$days días $hours horas $minutes minutos $seconds segundos';
    _timeRemaining[index] = timeRemaining;
    return timeRemaining;
  }

  void _toggleTimer(int index, DateTime deadline) {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }

    setState(() {
      if (_timerIsActive.containsKey(index) && _timerIsActive[index] == true) {
        _timerIsActive[index] = false;
      } else {
        _timerIsActive[index] = true;
        _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
          final timeRemaining = _getTimeRemaining(index, deadline);
          if (timeRemaining == '0 días 0 horas 0 minutos 0 segundos') {
            timer.cancel();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('¡Tiempo agotado!')));
          }
          setState(() {});
        });
      }
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks!.removeAt(index);
    });
  }
}

// class Task {
//   late String project;
//   final String hour;
//   late String title;
//   late String description;
//   final DateTime fechaLimite;
//   final DateTime fechaRealizacion;
//   final List<String> integrantes;
//   final List<String> proyectos;

//   Task({
//     required this.project,
//     required this.hour,
//     required this.title,
//     required this.description,
//     required this.fechaLimite,
//     required this.fechaRealizacion,
//     required this.integrantes,
//     required this.proyectos,
//   });
// }
