import 'package:flutter/material.dart';
import 'package:todo_practica_final/views/important_view.dart';

class HomeView extends StatefulWidget {
  static const String name = "my_day_view";

  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    // Inicializar las tareas
    tasks = [
      Task(
        project: 'Proyecto A',
        hour: '08:00',
        title: 'Tarea:',
        description: 'Descripción de la tarea 1',
        important: false,
        completed: false,
        steps: [],
      ),
      Task(
        project: 'Proyecto B',
        hour: '10:00',
        title: 'Tarea:',
        description: 'Descripción de la tarea 2',
        important: true,
        completed: false,
        steps: [],
      ),
      Task(
        project: 'Proyecto C',
        hour: '12:00',
        title: 'Tarea:',
        description: 'Descripción de la tarea 3',
        important: false,
        completed: false,
        steps: [],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
      ),
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
                      Text(task.project),
                      Text(task.title),
                      Text(task.description),
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'editar',
                        child: Text('Editar'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'eliminar',
                        child: Text('Eliminar'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'importante',
                        child: Text('Importante'),
                      ),
                    ],
                    onSelected: (String value) {
                      switch (value) {
                        case 'editar':
                          _editTask(context, task);
                          break;
                        case 'eliminar':
                          _deleteTask(task);
                          break;
                        case 'importante':
                          break;
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _editTask(BuildContext context, Task task) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Editar Tarea'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: task.project,
              decoration: const InputDecoration(labelText: 'Proyecto'),
              onChanged: (value) {
                setState(() {
                  task.project = value;
                });
              },
            ),
            TextFormField(
              initialValue: task.title,
              decoration: const InputDecoration(labelText: 'Título'),
              onChanged: (value) {
                setState(() {
                  task.title = value;
                });
              },
            ),
            TextFormField(
              initialValue: task.description,
              decoration: const InputDecoration(labelText: 'Descripción'),
              onChanged: (value) {
                setState(() {
                  task.description = value;
                });
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Aquí puedes guardar los cambios si es necesario
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  void _deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  Future<void> _addTask(BuildContext context) async {
    final TextEditingController projectController = TextEditingController();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    final newTask = await showDialog<Task>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nueva Tarea'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: projectController,
              decoration: const InputDecoration(labelText: 'Proyecto'),
            ),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              final project = projectController.text.trim();
              final title = titleController.text.trim();
              final description = descriptionController.text.trim();

              // Verificar si alguno de los campos está vacío
              if (project.isNotEmpty && title.isNotEmpty && description.isNotEmpty) {
                final newTask = Task(
                  project: project,
                  hour: '00:00', // Hora por defecto, puedes cambiarlo si es necesario
                  title: title,
                  description: description,
                  important: false,
                  completed: false,
                  steps: [],
                );
                Navigator.pop(context, newTask);
              } else {
                // Mostrar un mensaje de advertencia si hay campos vacíos
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Por favor, complete todos los campos.'),
                  ),
                );
              }
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );

    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
      });
    }
  }
}

class Task {
  late String project;
  final String hour;
  late String title;
  late String description;
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
