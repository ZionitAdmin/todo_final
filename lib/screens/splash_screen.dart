import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/providers/auth_provider.dart';

class SplashScreen extends StatelessWidget {
  static const String name = "splash_screen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future(() => context.read<AuthProvider>().checkStatus());

    return const Scaffold(
      body: Center(child: Text("Cargando...")),
    );
  }
}
