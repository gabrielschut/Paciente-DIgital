import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final String fieldName;
  final String suffix;
  final TextEditingController controller;
  final FocusNode focusNode;

  const MyTextField({
    Key? key,
    required this.hint,
    required this.fieldName,
    required this.suffix,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onFieldSubmitted: (String string){
          focusNode.requestFocus();
        },
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
