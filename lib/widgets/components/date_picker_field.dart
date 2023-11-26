import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DatePickerField extends StatefulWidget {
  final String hint;
  final String suffix;
  final String dateFieldName;
  final TextEditingController controller;
  final FocusNode focusNode;

  const DatePickerField({
    Key? key,
    required this.hint,
    required this.suffix,
    required this.dateFieldName,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final maskDate = MaskTextInputFormatter(mask: '##/##/####');

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        width: 252,
        child: Flexible(
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            onFieldSubmitted: (String string) {
              widget.focusNode.requestFocus();
            },
            inputFormatters: [maskDate],
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: widget.dateFieldName,
              labelStyle: const TextStyle(
                color: Colors.lightBlue,
              ),
              helperText: "",
              hintText: widget.hint,
            ),
          ),
        ),
      ),
    );
  }
}
