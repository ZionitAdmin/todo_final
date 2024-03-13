import 'package:flutter/material.dart';

class AppbarProvider extends ChangeNotifier {
  String _title = "Mi Dia";

  changeTitle(String title) {
    _title = title;
    notifyListeners();
  }

  get title => _title;
}
