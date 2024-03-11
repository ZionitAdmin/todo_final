import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_practica_final/config/functions/mail_validator.dart';
import 'package:todo_practica_final/config/input_styles.dart';
import 'package:todo_practica_final/db/interfaces/registro_repo.dart'; // Importamos la interfaz del repositorio
import 'package:todo_practica_final/db/repository/registro_repo_impl.dart'; // Importamos la implementación del repositorio
import 'package:todo_practica_final/widgets/my_filled_button.dart';
import 'package:todo_practica_final/widgets/my_text_form_field.dart';
import '../model/registro_model.dart';

class RegistroScreen extends StatefulWidget {
  static const String name = "registro_screen";
  const RegistroScreen({Key? key}) : super(key: key);

  @override
  RegistroScreenState createState() => RegistroScreenState();
}

class RegistroScreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  DateTime _fechaNacimiento = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextFormField(
                  controller: _nombreController,
                  label: "Nombre",
                  borderStyle: myInputBorder,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    if (value.length <= 2) {
                      return 'Debe contener al menos 3 caracteres';
                    }
                    return null;
                  },
                ),
                MyTextFormField(
                  controller: _apellidoController,
                  label: "Apellido",
                  borderStyle: myInputBorder,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu apellido';
                    }
                    if (value.length <= 2) {
                      return 'Debe contener al menos 3 caracteres';
                    }
                    return null;
                  },
                ),
                MyTextFormField(
                  controller: _correoController,
                  label: "Correo",
                  borderStyle: myInputBorder,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu correo';
                    }
                    if (!validarCorreo(value)) {
                      return 'Debe ingresar un correo valido';
                    }
                    return null;
                  },
                ),
                MyTextFormField(
                  controller: _contrasenaController,
                  label: "Contraseña",
                  borderStyle: myInputBorder,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu contraseña';
                    }
                    if (value.length <= 3) {
                      return 'Debe contener al menos 4 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Fecha de Nacimiento: ${DateFormat("dd-MM-yyyy").format(_fechaNacimiento).toString()}',
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _fechaNacimiento,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _fechaNacimiento = pickedDate;
                          });
                        }
                      },
                      child: const Text('Seleccionar Fecha'),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          context.go('/login');
                        },
                        child: const Text("Cancelar"),
                      ),
                    ),
                    Expanded(
                      child: MyFilledButton(
                        label: "Guardar",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _guardarDatosDeRegistro();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _guardarDatosDeRegistro() async {
    final edadActual = DateTime.now().difference(_fechaNacimiento).inDays / 365;

    if (edadActual < 18) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Debe tener mas de 18 años para registrarse")));
      return;
    }

    RegistroData registro = RegistroData(
      nombre: _nombreController.text,
      apellido: _apellidoController.text,
      fechaNacimiento: _fechaNacimiento,
      correo: _correoController.text,
      contrasena: _contrasenaController.text,
    );

    RegistroRepo repo = RegistroRepoImpl();

    try {
      await repo.guardarDatosDeRegistro(registro);
      print('Los datos se han guardado correctamente en la base de datos.');
    } catch (e) {
      print(
          'Ha ocurrido un error al guardar los datos en la base de datos: $e');
    }

    context.go('/login');
  }
}
