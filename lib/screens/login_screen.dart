import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/config/input_styles.dart';
import 'package:todo_practica_final/providers/login_provider.dart';
import 'package:todo_practica_final/widgets/my_filled_button.dart';
import 'package:todo_practica_final/widgets/my_text_form_field.dart';
// Importa el RegistroScreen

class LoginScreen extends StatelessWidget {
  static const String name = "login_screen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextFormField(
                  borderStyle: myInputBorder,
                  label: "Correo Electrónico",
                  prefixIcon: const Icon(Icons.person),
                ),
                const SizedBox(height: 20),
                MyTextFormField(
                    obscureText:
                        !context.watch<LoginProvider>().isPasswordVisible,
                    label: 'Contraseña',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          (context.watch<LoginProvider>().isPasswordVisible)
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye),
                      onPressed: () => context
                          .read<LoginProvider>()
                          .togglePasswordVisibility(),
                    ),
                    borderStyle: myInputBorder),

                const SizedBox(height: 20),
                MyFilledButton(
                  label: "iniciar sesión",
                  labelSize: 16,
                  onPressed: () {
                    context.go('/');
                  },
                ),

                const SizedBox(
                    height: 20), // Agrega un espacio entre los botones
                ElevatedButton(
                  onPressed: () {
                    context.push('/registro');
                  },
                  child: const Text('Registrarse'),
                ),
                const SizedBox(height: 20),
                const TextButton(
                  onPressed: null,
                  child: Text('¿Olvidaste tu contraseña?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
