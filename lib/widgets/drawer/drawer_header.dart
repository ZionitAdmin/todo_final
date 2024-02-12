import 'package:flutter/material.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 10, left: 20, right: 20),
      child: const Row(
        children: [
          Icon(Icons.logo_dev_outlined),
          SizedBox(width: 10),
          Text("ToDo App")
        ],
      ),
    );
  }
}
