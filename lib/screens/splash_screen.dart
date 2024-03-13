import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String name = "splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future(() => context.read<AuthProvider>().checkStatus());
  }

  @override
  Widget build(BuildContext context) {
    final message =
        (context.watch<AuthProvider>().authStatus == AuthStatus.checking)
            ? "Identificando usuario"
            : "Cargando...";

    return Scaffold(
      body: Center(child: Text(message)),
    );
  }
}
