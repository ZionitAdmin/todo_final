import 'package:flutter/material.dart';
import 'package:todo_practica_final/views/important_view.dart';
import 'package:todo_practica_final/views/my_day_view.dart';
import 'package:todo_practica_final/views/pendant_view.dart';
import 'package:todo_practica_final/views/project_view.dart';

class AppConstants {
  static final homeScaffoldKey = GlobalKey<ScaffoldState>();
  static const double borderRadius = 15.0;

  static String getViewName(String indice) {
    switch (indice) {
      case HomeView.name:
        return "Mi Dia";
      case PendantView.name:
        return "Pendientes";
      case ProjectView.name:
        return "Proyectos";
      case ImportantView.name:
        return "Importantes";
      default:
        return "Mi Dia";
    }
  }
}
