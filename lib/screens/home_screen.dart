import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/db/repository/my_day_repo_impl.dart';
import 'package:todo_practica_final/model/my_day_model.dart';
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
  List<Tarjeta>? tasks;
  bool _showFloatingButton = true;
  Timer? _timer;
  late Map<int, String> _timeRemaining;

  @override
  void initState() {
    super.initState();
    _loadTasks();
    _timeRemaining = {};
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _loadTasks() async {
    final repo = MiDiaRepoImpl();
    tasks = await repo.obtenerTarjetas();
    setState(() {});
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
          final timeRemaining = _getTimeRemaining(index, task.fechaLimite);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Título: ${task.titulo}'),
                    const SizedBox(height: 8),
                    Text('Descripción: ${task.descripcion}'),
                    const SizedBox(height: 8),
                    Text('Fecha límite: ${task.fechaLimite.toString()}'),
                    const SizedBox(height: 8),
                    Text('Fecha realización: ${task.fechaRealizacion.toString()}'),
                    const SizedBox(height: 8),
                    Text('Tiempo restante: ${_timeRemaining[index] ?? timeRemaining}'),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showEditDialog(context, task),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteTask(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () => _toggleTimer(index, task.fechaLimite),
                        ),
                      ],
                    ),
                  ],
                ),
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

  void _addRandomTask() async {
    final random = Random();
    final project = 'Proyecto ${_randomString(1 + random.nextInt(3))}';
    final title = 'Tarea ${_randomString(5)}';
    final description = 'Descripción de la tarea ${_randomString(10)}';
    final task = Tarjeta(
      titulo: title,
      descripcion: description,
      fechaLimite: DateTime.now().add(const Duration(days: 1)),
      fechaRealizacion: DateTime.now(),
      integrantes: ['Usuario1'],
      proyectos: ['Proyecto1'],
    );
    final repo = MiDiaRepoImpl();
    await repo.guardarDatosDeMiDia(task);
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
    final timeRemaining = '$days días $hours horas $minutes minutos $seconds segundos';
    _timeRemaining[index] = timeRemaining;
    return timeRemaining;
  }

  void _toggleTimer(int index, DateTime deadline) {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        final timeRemaining = _getTimeRemaining(index, deadline);
        if (timeRemaining == '0 días 0 horas 0 minutos 0 segundos') {
          timer.cancel();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Tiempo agotado!')));
        }
        setState(() {});
      });
    }
  }

  void _showEditDialog(BuildContext context, Tarjeta task) {
    final TextEditingController titleController = TextEditingController(text: task.titulo);
    final TextEditingController descriptionController = TextEditingController(text: task.descripcion);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Tarea'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                task.titulo = titleController.text;
                task.descripcion = descriptionController.text;
                _updateTask(task);
                setState(() {});
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  void _updateTask(Tarjeta task) async {
    final repo = MiDiaRepoImpl();
    await repo.actualizarTarjeta(task);
  }

  void _deleteTask(int index) {
    setState(() {
      tasks!.removeAt(index);
    });
  }
}


class Task {
  late String project;
  final String hour;
  late String title;
  late String description;
  final DateTime fechaLimite;
  final DateTime fechaRealizacion;
  final List<String> integrantes;
  final List<String> proyectos;

  Task({
    required this.project,
    required this.hour,
    required this.title,
    required this.description,
    required this.fechaLimite,
    required this.fechaRealizacion,
    required this.integrantes,
    required this.proyectos,
  });
}
