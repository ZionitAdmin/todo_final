import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
        child: Padding(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        children: [Text("data")],
      ),
    ));
  }
}
