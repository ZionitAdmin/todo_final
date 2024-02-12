import 'package:go_router/go_router.dart';
import 'package:todo_practica_final/screens/home_screen.dart';
import 'package:todo_practica_final/views/important_view.dart';
import 'package:todo_practica_final/views/my_day_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (_, __, navigationShell) =>
          HomeScreen(children: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/',
            name: HomeView.name,
            builder: (context, state) => const HomeView(),
          ),
          GoRoute(
            path: '/important',
            name: ImportantView.name,
            builder: (context, state) => const ImportantView(),
          )
        ])
      ],
    )
  ],
);
