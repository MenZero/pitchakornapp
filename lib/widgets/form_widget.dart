// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
    this.hint,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  final String? hint;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
