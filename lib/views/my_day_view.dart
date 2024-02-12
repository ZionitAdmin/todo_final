import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/providers/theme_provider.dart';

class HomeView extends StatelessWidget {
  static const String name = "home_view";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          icon: const Icon(Icons.abc),
          onPressed: () => context.read<ThemeProvider>().toggleTheme()),
    );
  }
}
