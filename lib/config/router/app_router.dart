import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/providers/auth_provider.dart';
import 'package:todo_practica_final/providers/login_provider.dart';
import 'package:todo_practica_final/providers/registro_provider.dart';
import 'package:todo_practica_final/screens/home_screen.dart';
import 'package:todo_practica_final/screens/login_screen.dart';
import 'package:todo_practica_final/screens/splash_screen.dart';
import 'package:todo_practica_final/views/important_view.dart';
import 'package:todo_practica_final/views/my_day_view.dart';
import 'package:todo_practica_final/views/pendant_view.dart';
import 'package:todo_practica_final/providers/task_provider.dart';

import '../../screens/registro_screen.dart';
import '../../views/project_view.dart';

GoRouter appRouter(BuildContext context) {
  final auth = context.watch<AuthProvider>();
  return GoRouter(
    refreshListenable: AuthProvider(),
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: SplashScreen.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: LoginScreen.name,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => LoginProvider(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/registro',
        name: RegistroScreen.name,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => RegisterProvider(),
          child: const RegistroScreen(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, __, navigationShell) =>
            ChangeNotifierProvider<TaskProvider>(
              create: (_) => TaskProvider(), // Aquí creas una nueva instancia de TaskProvider
              builder: (context, _) => const HomeScreen(), // Aquí pasas HomeScreen como hijo de ChangeNotifierProvider
            ),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/',
              name: HomeView.name,
              builder: (context, state) => ChangeNotifierProvider<TaskProvider>(
                create: (_) => TaskProvider(), // Aquí creas una nueva instancia de TaskProvider
                builder: (context, _) => const HomeView(), // Aquí pasas HomeView como hijo de ChangeNotifierProvider
              ),
            ),
            GoRoute(
              path: '/important',
              name: ImportantView.name,
              builder: (context, state) => const ImportantView(),
            ),
            GoRoute(
              path: '/pendant',
              name: PendantView.name,
              builder: (context, state) => const PendantView(),
            ),
            GoRoute(
              path: '/project',
              name: ProjectView.name,
              builder: (context, state) => const ProjectView(),
            ),
          ]),
        ],
      )
    ],

    redirect: (_, state) {
      final path = state.matchedLocation;

      if (path == '/registro') {
        return null;
      }

      if ((path == "/splash" || path == "/login") && auth.isLoggedIn()) {
        return "/";
      }

      if (auth.authStatus == AuthStatus.loggedOut) {
        return "/login";
      }

      return null;
    },
  );
}


