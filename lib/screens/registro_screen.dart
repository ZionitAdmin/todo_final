import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/config/functions/mail_validator.dart';
import 'package:todo_practica_final/config/input_styles.dart';
import 'package:todo_practica_final/providers/registro_provider.dart';
import 'package:todo_practica_final/widgets/my_filled_button.dart';
import 'package:todo_practica_final/widgets/my_text_form_field.dart';

class RegistroScreen extends StatefulWidget {
  static const String name = "registro_screen";
  const RegistroScreen({Key? key}) : super(key: key);

  @override
  RegistroScreenState createState() => RegistroScreenState();
}

class RegistroScreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerState = context.watch<RegisterProvider>();

    Future<void> guardarDatosDeRegistro() async {
      try {
        await registerState.handleSubmit().then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Registrado exitosamente")));
          context.go('/login');
        }).onError((error, stackTrace) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error.toString())));
        });
      } catch (_) {}
    }

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
                  controller: registerState.nombreController,
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
                  controller: registerState.apellidoController,
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
                  controller: registerState.correoController,
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
                  controller: registerState.contrasenaController,
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
                        'Fecha de Nacimiento: ${DateFormat("dd-MM-yyyy").format(registerState.fechaNacimiento).toString()}',
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: registerState.fechaNacimiento,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          registerState.changeBirthDate(pickedDate);
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
                            await guardarDatosDeRegistro();
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
}
