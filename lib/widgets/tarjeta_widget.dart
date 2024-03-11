import 'package:flutter/material.dart';
import '../model/my_day_model.dart'; // Importa el modelo Tarjeta aquí

class TarjetaWidget extends StatelessWidget {
  final Tarjeta task;

  const TarjetaWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Título: ${task.titulo}'),
                const SizedBox(height: 8),
                Text('Descripción: ${task.descripcion}'),
                const SizedBox(height: 8),
                Text('Fecha límite: ${task.fechaLimite.toString()}'),
                const SizedBox(height: 8),
                Text('Fecha realización: ${task.fechaRealizacion.toString()}'),
              ],
            ),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                // Otros elementos de acción aquí si es necesario
              ],
            ),
          ),
        ),
      ),
    );
  }


  }

