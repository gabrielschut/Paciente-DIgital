import 'package:flutter/material.dart';
import 'package:paciente_digital/widgets/components/dropdown_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';

class EditPacienteForm extends StatefulWidget {
  const EditPacienteForm({Key? key}) : super(key: key);

  @override
  State<EditPacienteForm> createState() => _EditPacienteFormState();
}

class _EditPacienteFormState extends State<EditPacienteForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController wightController = TextEditingController();
  TextEditingController diabetisController = TextEditingController();
  TextEditingController cariacoController = TextEditingController();
  TextEditingController circAbdominalCOntroller = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Cadastro de novo paciente',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: MyTextField(
              hint: 'João Maria',
              fieldName: 'Nome',
              suffix: 'abc',
              controller: nameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Gênero',
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
                      'Masculino',
                      'Feminino',
                      'Masculino Trans',
                      'Feminino Trans'
                    ],
                    hint: 'Genero',
                    controller: sexController,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Tipo Sanguíneo',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: DropdownField(
                    DropOpcoes: const [
                      'A+',
                      'B+',
                      'AB+',
                      'O+',
                      'A-',
                      'B-',
                      'AB-',
                      'O-'
                    ],
                    hint: 'AB-',
                    controller: bloodTypeController,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: NumberField(
              suffix: 'KG',
              fieldName: 'Peso',
              hint: "70.45",
              controller: wightController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: NumberField(
              suffix: 'Metros',
              fieldName: 'Altura',
              hint: "1.70",
              controller: heightController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'É Cardíaco',
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
                    DropOpcoes: const ['Sim', 'Não'],
                    hint: '???',
                    controller: cariacoController,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'É Diabético',
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
                      DropOpcoes: const ['Sim', 'Não'],
                      hint: '???',
                      controller: diabetisController),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: NumberField(
              suffix: 'Centimetros',
              fieldName: 'Circunferência Abdominal',
              hint: "101,5",
              controller: circAbdominalCOntroller,
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //chamar o post paciente
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
