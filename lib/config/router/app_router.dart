import 'package:go_router/go_router.dart';
import 'package:todo_practica_final/screens/home_screen.dart';
import 'package:todo_practica_final/views/important_view.dart';
import 'package:todo_practica_final/views/my_day_view.dart';
import 'package:todo_practica_final/views/login_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login', // Establece la ruta inicial como '/login'
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (_, __, navigationShell) =>
          HomeScreen(children: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/',
            name: HomeView.name,
            builder: (context, state) => HomeView(),
          ),
          GoRoute(
            path: '/important',
            name: ImportantView.name,
            builder: (context, state) => const ImportantView(),
          ),
          GoRoute(
            path: '/login',
            name: LoginView.name,
            builder: (context, state) => const LoginView(),
          ),
        ]),
      ],
    )
  ],
);
