import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final String fieldName;
  final String suffix;

  const MyTextField({
    Key? key,
    required this.hint,
    required this.fieldName,
    required this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        style: TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          helperText: "",
          hintText: hint,
          labelText: fieldName,
          labelStyle: TextStyle(
            color: Colors.lightBlue,
          ),
          suffixText: suffix,
        ),
      ),
    );
  }
}
