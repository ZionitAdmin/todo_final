import 'dart:io';

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final double topPadding = Platform.isAndroid ? 40 : 60;

    return Drawer(
        child: Padding(
      padding: EdgeInsets.only(top: topPadding, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _DrawerHeader(),
          const Divider(indent: 10, endIndent: 10),
          const SizedBox(height: 10),
          DrawerItem(
              name: "Mi Dia",
              icon: const Icon(Icons.home),
              bgColor: Colors.blue.shade100),
          const SizedBox(height: 5),
          DrawerItem(
              name: "Importante",
              icon: const Icon(Icons.star),
              bgColor: Colors.red.shade100),
          const SizedBox(height: 5),
          DrawerItem(
              name: "Pendientes",
              icon: const Icon(Icons.pending_actions),
              bgColor: Colors.green.shade100),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Etiquetas"),
          )
        ],
      ),
    ));
  }
}

class DrawerItem extends StatelessWidget {
  final String name;
  final Widget? leading;
  final Widget? icon;
  final Color? bgColor;
  const DrawerItem({
    super.key,
    required this.name,
    this.leading,
    this.icon,
    this.bgColor = Colors.black12,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.maxFinite,
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 15, right: 32),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Row(
          children: [
            if (icon != null) icon!,
            const SizedBox(width: 15),
            Expanded(child: Text(name)),
            if (leading != null) leading!
          ],
        ),
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.logo_dev_outlined),
          SizedBox(width: 10),
          Text("ToDo App")
        ],
      ),
    );
  }
}
