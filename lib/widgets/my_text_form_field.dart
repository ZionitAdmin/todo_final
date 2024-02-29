import 'package:flutter/material.dart';
import 'package:todo_practica_final/config/constants.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;

  final String? label;
  final InputBorder? borderStyle;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged; // Nuevo parámetro onChanged

  const MyTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.label = "",
    this.borderStyle,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged, // Añadido onChanged aquí
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(AppConstants.borderRadius),
          prefix: prefixIcon,
          suffix: suffixIcon,
          labelText: label,
          border: borderStyle,
        ),
        validator: validator,
        onChanged: onChanged, // Pasar onChanged al TextFormField interno
      ),
    );
  }
}
