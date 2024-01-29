import 'package:flutter/material.dart';
import 'package:todo_practica_final/widgets/sidebar.dart';

class HomeScreen extends StatelessWidget {
  final Widget children;
  const HomeScreen({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mi Dia"),
            Text(
              "Lunes, 29 de enero",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        toolbarHeight: 100,
        actions: const [
          Padding(padding: EdgeInsets.all(16), child: Icon(Icons.notifications))
        ],
      ),
      drawer: const MyDrawer(),
      body: children,
    );
  }
}
