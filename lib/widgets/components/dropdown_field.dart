import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final List<String> DropOpcoes;
  final String hint;
  final TextEditingController controller;
  final FocusNode focusNode;

  DropdownField({
    Key? key,
    required this.DropOpcoes,
    required this.hint,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  final dropValue = ValueNotifier('');

  String? _value;

  @override
  Widget build(BuildContext context) {
    _value = DropOpcoes[0];
    return DropdownButtonFormField(
      focusNode: focusNode,
      items: DropOpcoes.map((String item) => DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )).toList(),
      onChanged: (value) {
        setState() {
          _value = _value as String;
        }
      },
      value: _value,
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      iconSize: 28,
      iconEnabledColor: Colors.lightBlue,
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      );
}
