import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  final icon;
  final labelText;
  final controller;
  final inputType;
  final isObscure;
  final maxLength;
  final maxLines;
  FieldForm({
    Key? key,
    required this.icon,
    required this.labelText,
    required this.controller,
    this.isObscure = false,
    this.inputType = TextInputType.text,
    required this.maxLength,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          // fillColor: Colors.blue,
          focusColor: Colors.deepPurple,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: icon,
          labelText: labelText,
          contentPadding: const EdgeInsets.all(3.5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        controller: controller,
        obscureText: isObscure,
        keyboardType: inputType,
        maxLength: maxLength,
        maxLines: maxLines,
      ),
    );
  }
}
