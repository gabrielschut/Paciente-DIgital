import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final String fieldName;
  final String suffix;
  final TextEditingController controller;

  const MyTextField({
    Key? key,
    required this.hint,
    required this.fieldName,
    required this.suffix,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          helperText: "",
          hintText: hint,
          labelText: fieldName,
          labelStyle: const TextStyle(
            color: Colors.lightBlue,
          ),
          suffixText: suffix,
        ),
      ),
    );
  }
}
