import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/config/constants.dart';
import 'package:todo_practica_final/providers/appbar_provider.dart';
import 'package:todo_practica_final/providers/drawer_provider.dart';
import 'package:todo_practica_final/views/important_view.dart';
import 'package:todo_practica_final/views/my_day_view.dart';
import 'package:todo_practica_final/widgets/drawer/drawer_footer.dart';
import 'package:todo_practica_final/widgets/drawer/drawer_header.dart';
import 'package:todo_practica_final/widgets/drawer/drawer_item.dart';

import '../../views/pendant_view.dart';
import '../../views/project_view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    print("render");

    handleTapMenu(BuildContext context, int index, String viewName) {
      AppConstants.homeScaffoldKey.currentState?.closeDrawer();
      context.read<DrawerProvider>().setSelectedMenuIndex(index);
      context.pushNamed(viewName);
      context.read<AppbarProvider>().changeTitle(viewName);
    }

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyDrawerHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(indent: 10, endIndent: 10),
                    MyDrawerItem(
                      title: "Mi Dia",
                      icon: Icons.sunny,
                      subTitle: "5 tareas pendientes",
                      isSelected:
                          context.watch<DrawerProvider>().isMenuActive(0),
                      onTap: () => handleTapMenu(context, 0, HomeView.name),
                    ),
                    MyDrawerItem(
                      title: "Importante",
                      icon: Icons.star,
                      isSelected:
                          context.watch<DrawerProvider>().isMenuActive(1),
                      onTap: () =>
                          handleTapMenu(context, 1, ImportantView.name),
                    ),
                    MyDrawerItem(
                      title: "Pendientes",
                      icon: Icons.pending_actions,
                      isSelected:
                          context.watch<DrawerProvider>().isMenuActive(2),
                      onTap: () =>    handleTapMenu(context, 2, PendantView.name),

          ),
                    MyDrawerItem(
                      title: "Mis Proyectos",
                      icon: Icons.list,
                      isSelected:
                          context.watch<DrawerProvider>().isMenuActive(3),
                      onTap: () =>  handleTapMenu(context, 3, ProjectView.name),

                    ),
                    const Divider(indent: 10, endIndent: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Configuraciones",
                        style: textStyle.titleSmall,
                      ),
                    ),
                    MyDrawerItem(
                      title: "Configuracion",
                      icon: Icons.settings,
                      isSelected:
                          context.watch<DrawerProvider>().isMenuActive(4),
                      onTap: () => context
                          .read<DrawerProvider>()
                          .setSelectedMenuIndex(4),
                    ),
                  ]),
            ),
          ),
          const MyDrawerFooter()
        ],
      ),
    );
  }
}
