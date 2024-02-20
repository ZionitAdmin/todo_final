import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/config/constants.dart';
import 'package:todo_practica_final/providers/appbar_provider.dart';
import 'dart:math';


import '../widgets/drawer/drawer.dart';

class HomeScreen extends StatefulWidget {
  final Widget children;
  const HomeScreen({Key? key, required this.children}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    tasks = []; // Inicializar la lista de tareas vacía
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppConstants.homeScaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.watch<AppbarProvider>().title),
            const Text(
              "Lunes, 29 de enero",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        toolbarHeight: 100,
        actions: const [
          Padding(padding: EdgeInsets.all(16), child: Icon(Icons.notifications))
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
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
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Proyecto: ${task.project}'),
                      const SizedBox(height: 8),
                      Text('Tarea: ${task.title}'),
                      const SizedBox(height: 8),
                      Text('Descripción: ${task.description}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteTask(index),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRandomTask,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addRandomTask() {
    final random = Random();
    final project = 'Proyecto ${_randomString(1 + random.nextInt(3))}';
    final title = 'Tarea ${_randomString(5)}';
    final description = 'Descripción de la tarea ${_randomString(10)}';
    final task = Task(
      project: project,
      hour: '00:00', // Hora por defecto
      title: title,
      description: description,
      important: false,
      completed: false,
      steps: [],
    );
    setState(() {
      tasks.add(task);
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  String _randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(length, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }
}

class Task {
  final String project;
  final String hour;
  final String title;
  final String description;
  final bool important;
  final bool completed;
  final List<String> steps;

  Task({
    required this.project,
    required this.hour,
    required this.title,
    required this.description,
    required this.important,
    required this.completed,
    required this.steps,
  });
}
