import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/dropdown_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';

class NewMedicine extends StatefulWidget {
  const NewMedicine({Key? key}) : super(key: key);

  @override
  State<NewMedicine> createState() => _NewMedicineState();
}

class _NewMedicineState extends State<NewMedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Cadastro de Medicamento",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: MyTextField(
              hint: 'Doril',
              fieldName: 'Nome',
              suffix: 'abc',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Tarja',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 250,
                  child: DropdownField(DropOpcoes: const [
                    'Sem tarja',
                    'Amarela',
                    'Vermelha',
                    'Preta'
                  ], hint: 'Tarja'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 80,
                  child: const Text(
                    'Um a cada ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 250,
                  child: DropdownField(DropOpcoes: const [
                    '24 horas',
                    '12 horas',
                    '8 horas',
                    '6 horas',
                    '4 horas',
                    '3 horas',
                    '2 horas',
                    '1 hora'
                  ], hint: 'Horas'),
                ),
              ],
            ),
          ),
          DatePickerField(
              fieldName: "Data Incial", hint: "01/01/2000", suffix: ""),
        ],
      ),
    );
  }
}
