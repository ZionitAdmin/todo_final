import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/floating_button_visibility.dart'; // Importa el ChangeNotifier

class ProjectView extends StatelessWidget {
  static const String name = "project_view";

  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final floatingButtonVisibility = Provider.of<FloatingButtonVisibility>(context, listen: false);
    floatingButtonVisibility.isVisible = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyectos'),
      ),
      body: const Center(
        child: Text("Proyectos"),
      ),
    );
  }
}
