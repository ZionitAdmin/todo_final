import 'package:flutter/material.dart';
import 'package:todo_practica_final/config/environment.dart';
import 'package:todo_practica_final/db/repository/user_repo_impl.dart';
import 'package:todo_practica_final/model/user_model.dart';
import 'package:todo_practica_final/services/jwt.dart';
import 'package:todo_practica_final/services/key_value_storage_service_impl.dart';

enum AuthStatus { checking, loggedIn, loggedOut }

class AuthProvider extends ChangeNotifier {
  AuthStatus _authStatus = AuthStatus.checking;
  User? user;
  final sPref = KeyValueStorageServiceImpl();
  final userRepo = UserRepoImpl();

  get authStatus => _authStatus;

  void checkStatus() async {
    try {
      changeStatus(AuthStatus.checking);
      await Future.delayed(const Duration(seconds: 3));

      final token = await sPref.getValue<String>(Environment.tokenName);

      if (token == null) {
        await logOut();
        return;
      }
      final userPayload = Jwt.verify(token);

      final loggedUser = await userRepo.obtenerUsuarioPorId(userPayload['id']);

      if (loggedUser == null) {
        await logOut();
        return;
      }

      user = loggedUser;
      changeStatus(AuthStatus.loggedIn);
    } catch (e) {
      await logOut();
    } finally {
      notifyListeners();
    }
  }

  Future<void> logIn(User user) async {
    final jwt = Jwt.sign({"id": user.isarId});
    await sPref.setKeyValue(Environment.tokenName, jwt);
    this.user = user;
    changeStatus(AuthStatus.loggedIn);
    notifyListeners();
  }

  Future<void> logOut() async {
    await sPref.removeKey(Environment.tokenName);
    changeStatus(AuthStatus.loggedOut);
    notifyListeners();
  }

  void changeStatus(AuthStatus status) {
    _authStatus = status;
  }

  bool isLoggedIn() => (_authStatus == AuthStatus.loggedIn);
}
