import 'package:flutter/material.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';

class NewPressaoArterial extends StatefulWidget {
  const NewPressaoArterial({Key? key}) : super(key: key);

  @override
  State<NewPressaoArterial> createState() => _NewPressaoArterialState();
}

class _NewPressaoArterialState extends State<NewPressaoArterial> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Pressão Arterial",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 16, 0, 32),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: DatePickerField(
                hint: "01/01/2000",
                dateFieldName: "Tirado em ",
                suffix: "",
                initialDateController: _dateController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 16, 18),
                  child: Text(
                    'Preesão Art.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 24, 0),
                  child: SizedBox(
                    width: 230,
                    child: NumberField(
                      hint: "120",
                      fieldName: "Sistólica | Maxima",
                      suffix: "mmHg",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(
                  width: 120,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 24, 0),
                  child: SizedBox(
                    width: 230,
                    child: NumberField(
                      hint: "80",
                      fieldName: "Diastólica | Minima",
                      suffix: "mmHg",
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //chamar o save glicemia.
        },
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
