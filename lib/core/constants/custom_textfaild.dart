import 'package:flutter/material.dart';

class ComponentTextFaild extends StatelessWidget {
  const ComponentTextFaild({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,

        prefixIcon: prefixIcon,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
