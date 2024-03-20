import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/model/task_model.dart';
import 'package:todo_practica_final/providers/task_provider.dart';

class HomeView extends StatefulWidget {
  static const String name = "home_view";

  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Timer _timer;
  bool _isTimerActive = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimeRemaining);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Consumer<TaskProvider>(
              builder: (context, taskProvider, child) {
                return ListView.builder(
                  itemCount: taskProvider.tasks.length,
                  itemBuilder: (context, index) {
                    final task = taskProvider.tasks[index];
                    final timeRemaining = _getTimeRemaining(task.fechaLimite);

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          title: Text('Proyecto: ${task.proyectos}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Título: ${task.titulo}'),
                              Text('Descripción: ${task.descripcion}'),
                              Text('Fecha límite: ${task.fechaLimite.toString()}'),
                              SizedBox(height: 8),
                              Container(
                                padding: EdgeInsets.all(8),
                                color: Colors.red,
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(_isTimerActive ? Icons.pause : Icons.play_arrow),
                                      onPressed: () => _toggleTimer(index),
                                    ),
                                    SizedBox(width: 8),
                                    Text(timeRemaining),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addRandomTask(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addRandomTask(BuildContext context) {
    final random = Random();
    final task = Task(
      proyectos: 'Proyecto ${random.nextInt(10)}',
      titulo: 'Tarea ${random.nextInt(100)}',
      descripcion: 'Descripción de la tarea ${random.nextInt(100)}',
      fechaLimite: DateTime.now().add(Duration(days: random.nextInt(7) + 1)),
      fechaRealizacion: DateTime.now().subtract(Duration(days: random.nextInt(7))),
    );
    Provider.of<TaskProvider>(context, listen: false).addTask(task);
  }

  String _getTimeRemaining(DateTime deadline) {
    final now = DateTime.now();
    final difference = deadline.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;
    return '$days días $hours horas $minutes minutos $seconds segundos';
  }

  void _toggleTimer(int index) {
    setState(() {
      _isTimerActive = !_isTimerActive; // Cambiar el estado del cronómetro
    });
  }

  void _updateTimeRemaining(Timer timer) {
    // Implementar la lógica para actualizar el tiempo restante
    setState(() {
      // Actualizar el tiempo restante de las tareas
    });
  }
}
