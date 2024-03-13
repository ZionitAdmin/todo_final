import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/providers/auth_provider.dart';
import 'package:todo_practica_final/providers/theme_provider.dart';
import 'package:todo_practica_final/widgets/custom_container.dart';

class MyDrawerFooter extends StatelessWidget {
  const MyDrawerFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: CustomContainer(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderVariant: BorderVariant.all,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Switch(
                      value: context.read<ThemeProvider>().isInLightMode(),
                      onChanged: (_) =>
                          context.read<ThemeProvider>().toggleTheme(),
                      thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return const Icon(Icons.light_mode);
                        }
                        return const Icon(Icons
                            .dark_mode); // All other states will use the default thumbIcon.
                      })),
                  PopupMenuButton(
                    child: CircleAvatar(
                      child: Text(
                          context.watch<AuthProvider>().user?.getUserName() ??
                              "NA"),
                    ),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: "logout",
                        child: Text("Cerrar Sesión"),
                      )
                    ],
                    onSelected: (value) {
                      if (value == "logout") {
                        context.read<AuthProvider>().logOut();
                      }
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
