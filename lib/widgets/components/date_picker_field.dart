import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DatePickerField extends StatefulWidget {
  final String hint;
  final String suffix;
  final String dateFieldName;
  final TextEditingController? controller;

  const DatePickerField({
    Key? key,
    required this.hint,
    required this.suffix,
    required this.dateFieldName,
    this.controller,
  }) : super(key: key);

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final maskDate = MaskTextInputFormatter(mask: '##/##/####');

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 16),
                child: Text(
                  widget.dateFieldName,
                  style: const TextStyle(
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 8, 0),
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: 230,
                  child: Flexible(
                    child: TextFormField(
                      inputFormatters: [maskDate],
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: false,
                      ),
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        helperText: "",
                        hintText: widget.hint,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
