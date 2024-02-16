import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  static const String name = "login_view";

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Campo para ingresar correo electrónico
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20), // Separación entre los campos
              // Campo para ingresar contraseña
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20), // Separación entre los campos
              // Enlace para "¿Olvidaste tu contraseña?"
              GestureDetector(
                onTap: () {
                  // Aquí puedes implementar la lógica para recuperar contraseña
                  // Por ahora, solo imprimimos un mensaje en la consola
                  print('Olvidaste tu contraseña?');
                },
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Separación entre los campos
              // Botón para iniciar sesión
              ElevatedButton(
                onPressed: () {
                  // Navegar al Home al pulsar el botón de iniciar sesión
                  GoRouter.of(context).go('/');
                },
                child: const Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

