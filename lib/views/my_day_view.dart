import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static const String name = "my_day_view";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("mi dia"),
    );
  }
}