import 'package:flutter/material.dart';

class MultilineField extends StatefulWidget {
  const MultilineField({Key? key}) : super(key: key);

  @override
  State<MultilineField> createState() => _MultilineFieldState();
}

class _MultilineFieldState extends State<MultilineField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      maxLength: 255,
      decoration: InputDecoration(
        helperText: "",
        hintText: "Descreva em até 255 caracteres",
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.abc_rounded),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Descrição",
                style: TextStyle(color: Colors.lightBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
