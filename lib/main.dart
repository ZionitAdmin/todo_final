import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/config/router/app_router.dart';
import 'package:todo_practica_final/providers/appbar_provider.dart';
import 'package:todo_practica_final/providers/drawer_provider.dart';
import 'package:todo_practica_final/providers/login_provider.dart';
import 'package:todo_practica_final/providers/theme_provider.dart';
import 'package:todo_practica_final/services/db_isar_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegura que los plugins de Flutter estén inicializados

  // Inicializa Isar previamente


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => DrawerProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => AppbarProvider()),
    ],
    child: const MainApp(),
  ));
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: context.watch<ThemeProvider>().theme,
    );
  }
}
// Define la función para inicializar Isar
Future<void> initIsar() async {
  final isarDBService = IsarDBService();
  await isarDBService.initIsar();
}