import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_practica_final/config/input_styles.dart';
import 'package:todo_practica_final/widgets/my_filled_button.dart';
import 'package:todo_practica_final/widgets/my_text_form_field.dart';

import '../model/registro_model.dart';
import '../services/registro_service.dart';

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
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Fecha de Nacimiento: ${_fechaNacimiento
                            .day}/${_fechaNacimiento.month}/${_fechaNacimiento
                            .year}',
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
                        if (pickedDate != null &&
                            pickedDate != _fechaNacimiento) {
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
                          Navigator.pop(context);
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
    RegistroData registro = RegistroData(
      nombre: _nombreController.text,
      apellido: _apellidoController.text,
      fechaNacimiento: _fechaNacimiento,
      correo: _correoController.text,
      contrasena: _contrasenaController.text,
    );

    RegistroService registroService = RegistroService();

    try {
      await registroService.guardarDatosDeRegistro(registro);
      print('Los datos se han guardado correctamente en la base de datos.');
    } catch (e) {
      print(
          'Ha ocurrido un error al guardar los datos en la base de datos: $e');
    }

    GoRouter.of(context).go('/login');
  }

}
