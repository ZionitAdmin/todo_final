import 'package:flutter/material.dart';

SnackBar snackBarPlayer(BuildContext context) {
  return SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(child: Text("CGP")),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Titulo"),
              Text("SubTitulo"),
            ],
          ),
        ),
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            icon: const Icon(Icons.play_arrow))
      ],
    ),
    duration: const Duration(days: 365),
    behavior: SnackBarBehavior.floating,
  );
}
