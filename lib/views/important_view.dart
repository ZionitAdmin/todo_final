import 'package:flutter/material.dart';

class ImportantView extends StatelessWidget {
  static const String name = "important_view";
  const ImportantView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Importante"),
    );
  }
}