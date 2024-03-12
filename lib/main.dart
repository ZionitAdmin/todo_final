import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/config/environment.dart';
import 'package:todo_practica_final/config/router/app_router.dart';
import 'package:todo_practica_final/providers/appbar_provider.dart';
import 'package:todo_practica_final/providers/auth_provider.dart';
import 'package:todo_practica_final/providers/drawer_provider.dart';
import 'package:todo_practica_final/providers/login_provider.dart';
import 'package:todo_practica_final/providers/theme_provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // final registroService = RegistroService();

  // final isarDBService = IsarDBService();
  // await isarDBService.db;

  await Environment.initEnvironment();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => DrawerProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => AppbarProvider()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter(context),
      theme: context.watch<ThemeProvider>().theme,
    );
  }
}
