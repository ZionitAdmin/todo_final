import 'package:flutter/material.dart';
import 'package:todo_practica_final/widgets/snackbar_player.dart';

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(snackBarPlayer(context));
}
