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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DrawerHeader(),
          Divider(indent: 10, endIndent: 10),
          SizedBox(height: 10),
          DrawerItem(name: "Home"),
          Text("data")
        ],
      ),
    ));
  }
}

class DrawerItem extends StatelessWidget {
  final String name;
  final Widget? leading;
  const DrawerItem({
    super.key,
    required this.name,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 15, right: 32),
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: Row(
        children: [
          const Icon(Icons.home),
          const SizedBox(width: 15),
          Expanded(child: Text(name)),
          if (leading != null) leading!
        ],
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
