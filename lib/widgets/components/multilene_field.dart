import 'package:flutter/material.dart';

class MultilineField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const MultilineField({
    Key? key,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<MultilineField> createState() => _MultilineFieldState();
}

class _MultilineFieldState extends State<MultilineField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      onFieldSubmitted: (String string){
        widget.focusNode.requestFocus();
      },
      maxLines: 8,
      maxLength: 255,
      decoration: const InputDecoration(
        helperText: "",
        hintText: "Descreva em até 255 caracteres",
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
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
