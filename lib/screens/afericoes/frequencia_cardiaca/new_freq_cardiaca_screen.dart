import 'package:flutter/material.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';

class NewFreqCardiaca extends StatefulWidget {
  const NewFreqCardiaca({Key? key}) : super(key: key);

  @override
  State<NewFreqCardiaca> createState() => _NewFreqCardiacaState();
}

class _NewFreqCardiacaState extends State<NewFreqCardiaca> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Frequência Cardiaca",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          DatePickerField(
            hint: "01/01/2000",
            dateFieldName: "Tirado em ",
            suffix: "",
            initialDateController: _dateController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                child: Text(
                  'Tipo',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 32, 0),
                child: SizedBox(
                  width: 230,
                  child: NumberField(
                    hint: "80",
                    fieldName: "pressão Art.",
                    suffix: "num",
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //chamar o save frequencia cardiaca.
        },
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
