import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paciente_digital/string_extension.dart';

class NumberField extends StatefulWidget {
  final String hint;
  final String fieldName;
  final String suffix;
  final TextEditingController controller;
  final FocusNode focusNode;

  const NumberField({
    Key? key,
    required this.hint,
    required this.fieldName,
    required this.suffix,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      onFieldSubmitted: (String string){
        widget.focusNode.requestFocus();
      },
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
      validator: (s) {
        if (!s!.isValidDouble() || s.isValidInt()) {
          return "Valor inválido";
        } else {
          return null;
        }
      },
      maxLength: 6,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      decoration: InputDecoration(
        labelText: widget.fieldName,
        labelStyle: const TextStyle(
          color: Colors.lightBlue,
        ),
        helperText: "",
        hintText: widget.hint,
        suffixText: widget.suffix,
      ),
    );
  }
}
