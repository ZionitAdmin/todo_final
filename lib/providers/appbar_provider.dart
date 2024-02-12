import 'package:flutter/material.dart';

class AppbarProvider extends ChangeNotifier {
  String _title = "Mi Dia";

  changeTitle(String title) => _title = title;

  get title => _title;
}
