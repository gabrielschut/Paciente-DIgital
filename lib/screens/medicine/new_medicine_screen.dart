import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/dropdown_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';

class NewMedicine extends StatefulWidget {
  const NewMedicine({Key? key}) : super(key: key);

  @override
  State<NewMedicine> createState() => _NewMedicineState();
}

class _NewMedicineState extends State<NewMedicine> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nomeController = TextEditingController();
    TextEditingController doseController = TextEditingController();
    TextEditingController tarjaController = TextEditingController();
    TextEditingController dataInicialController = TextEditingController();
    TextEditingController dataFinalController = TextEditingController();

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
              controller: nomeController,
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
                  child: DropdownField(
                      DropOpcoes: const [
                        'Sem tarja',
                        'Amarela',
                        'Vermelha',
                        'Preta'
                      ],
                      hint: 'Tarja',
                      controller: tarjaController,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: NumberField(fieldName: "Dosagem",controller: doseController, hint: "40.0 mg", suffix: "mg | ml"),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: DatePickerField(
              hint: "01/01/2001",
              dateFieldName: "data inicial",
              suffix: "",
              controller: dataInicialController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: DatePickerField(
              hint: "01/01/2001",
              dateFieldName: "data final",
              suffix: "",
              controller: dataFinalController,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: () {
          //chamar o save medicine
        },
      ),
    );
  }
}
