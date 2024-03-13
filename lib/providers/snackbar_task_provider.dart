import 'package:flutter/material.dart';

class SnackBarTaskProvider extends ChangeNotifier {
  bool _playerStatus = false;
  late DateTime startTime;

  get playerStatus => _playerStatus;
  void toggleStatus() {
    _playerStatus = !_playerStatus;
  }
}
