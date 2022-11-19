import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  final String hint;
  final String fieldName;
  final String suffix;

  const DatePickerField({
    Key? key,
    required this.hint,
    required this.fieldName,
    required this.suffix,
  }) : super(key: key);

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Text("Data inicial"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
                child: IconButton(
                  color: Colors.lightBlue,
                  iconSize: 45,
                  splashColor: Colors.lightBlue[100],
                  onPressed: () {
                    CalendarDatePicker(
                      initialDate: DateTime.now(),
                      lastDate: DateTime(2130),
                      firstDate: DateTime(1900),
                      onDateChanged: (DateTime value) {
                        _dateTime = value;
                      },
                    );
                  }, icon: Icon(Icons.calendar_month),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 230,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      helperText: widget.suffix,
                      hintText: widget.hint,
                      labelText: widget.fieldName,
                      labelStyle: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      suffixText: widget.suffix,
                    ),
                    initialValue: _dateTime.toString(),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
