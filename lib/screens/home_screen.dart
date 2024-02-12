import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_practica_final/config/constants.dart';
import 'package:todo_practica_final/providers/appbar_provider.dart';
import 'package:todo_practica_final/widgets/drawer/index.dart';

class HomeScreen extends StatelessWidget {
  final Widget children;
  const HomeScreen({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppConstants.homeScaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.watch<AppbarProvider>().title),
            const Text(
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
