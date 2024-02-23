import 'package:flutter/material.dart';
import '../model/registro_model.dart';
import '../services/registro_service.dart';
import 'login_screen.dart'; // Importa tu servicio de registro

class RegistroScreen extends StatefulWidget {
  static const String name = "registro_screen";
  const RegistroScreen({Key? key}) : super(key: key);

  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _apellidoController,
                decoration: const InputDecoration(labelText: 'Apellido'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu apellido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _correoController,
                decoration: const InputDecoration(labelText: 'Correo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu correo';
                  }
                  // Aquí podrías agregar validaciones adicionales para el formato del correo
                  return null;
                },
              ),
              TextFormField(
                controller: _contrasenaController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu contraseña';
                  }
                  // Aquí podrías agregar validaciones adicionales para la fortaleza de la contraseña
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Si el formulario es válido, captura los datos y los guarda
                    _guardarDatosDeRegistro();
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _guardarDatosDeRegistro() {
    // Crea una instancia de RegistroData con los datos capturados del usuario
    RegistroData registro = RegistroData(
      nombre: _nombreController.text,
      apellido: _apellidoController.text,
      fechaNacimiento: DateTime.now(), // Puedes agregar un campo de fecha de nacimiento en el futuro
      correo: _correoController.text,
      contrasena: _contrasenaController.text,
    );

    // Utiliza el servicio de registro para guardar los datos en la base de datos
    RegistroService registroService = RegistroService();
    registroService.guardarDatosDeRegistro(registro);

    // Redirige a la pantalla de inicio de sesión después de guardar los datos
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
