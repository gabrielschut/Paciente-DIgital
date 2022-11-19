import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final dropValue = ValueNotifier('');
  final List<String> DropOpcoes;
  final String hint;
  String? value;

  DropdownField({Key? key, required this.DropOpcoes, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: DropOpcoes.map(buildMenuItem).toList(),
      onChanged: (value) => dropValue.value = value.toString(),
      hint: Text(hint,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      value: (value != null)? null : value,
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
