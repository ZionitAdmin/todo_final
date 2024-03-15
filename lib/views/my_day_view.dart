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
  Timer? _timer;
  late Map<int, String> _timeRemaining;
  late Map<int, bool> _timerIsActive;

  @override
  void initState() {
    super.initState();
    _timeRemaining = {};
    _timerIsActive = {};
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<TaskProvider>(
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
                                Text('Proyecto: ${task.proyectos}'),
                                const SizedBox(height: 8),
                                Text('Título: ${task.titulo}'),
                                const SizedBox(height: 8),
                                Text('Descripción: ${task.descripcion}'),
                                const SizedBox(height: 8),
                                Text(
                                    'Fecha límite: ${task.fechaLimite.toString()}'),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(_timerIsActive[index] ?? false
                                        ? Icons.pause
                                        : Icons.play_arrow),
                                    onPressed: () => _toggleTimer(index),
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
                    ],
                  ),
                ),
              );
            },
          );
        },
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
    final timeRemaining =
        '$days días $hours horas $minutes minutos $seconds segundos';
    return timeRemaining;
  }

  void _toggleTimer(int index) {
    setState(() {
      if (_timerIsActive.containsKey(index) &&
          _timerIsActive[index] == true) {
        _timer?.cancel();
        _timerIsActive[index] = false;
      } else {
        _timerIsActive[index] = true;
        final task = Provider.of<TaskProvider>(context, listen: false).tasks[index];
        _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
          setState(() {
            _timeRemaining[index] = _getTimeRemaining(task.fechaLimite);
          });
        });
      }
    });
  }
}
