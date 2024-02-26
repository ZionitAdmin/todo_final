import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  final void Function()? onPressed;
  final double padding;
  final String label;
  final double labelSize;

  const MyFilledButton(
      {super.key,
      this.onPressed,
      this.padding = 12,
      required this.label,
      this.labelSize = 12});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: FilledButton(
        style: FilledButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: padding, horizontal: padding / 2)),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(fontSize: labelSize),
        ),
      ),
    );
  }
}
