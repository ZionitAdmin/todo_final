import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/config/input_styles.dart';
import 'package:todo_practica_final/providers/login_provider.dart';
import 'package:todo_practica_final/services/registro_service.dart'; // Importa el servicio de registro
import 'package:todo_practica_final/widgets/my_filled_button.dart';
import 'package:todo_practica_final/widgets/my_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static const String name = "login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final registroService = context.read<RegistroService>(); // Obtén el servicio de registro

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
                  onChanged: (value) =>
                      context.read<LoginProvider>().email = value,
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
                          : Icons.remove_red_eye,
                    ),
                    onPressed: () => context
                        .read<LoginProvider>()
                        .togglePasswordVisibility(),
                  ),
                  borderStyle: myInputBorder,
                  onChanged: (value) =>
                      context.read<LoginProvider>().password = value,
                ),
                const SizedBox(height: 20),
                MyFilledButton(
                  label: "Iniciar sesión",
                  labelSize: 16,
                  onPressed: () async {
                    final loginProvider = context.read<LoginProvider>();
                    final isValid = await loginProvider.login();

                    if (isValid) {
                      context.go(
                          '/'); // Si las credenciales son válidas, redirige al home
                    } else {
                      // Si las credenciales no son válidas, muestra un mensaje de error
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Credenciales incorrectas')),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.go('/registro');
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
