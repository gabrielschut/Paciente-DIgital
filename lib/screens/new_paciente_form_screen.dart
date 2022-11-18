import 'package:flutter/material.dart';
import 'package:paciente_digital/widgets/components/dropdown_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';

class NewPacienteForm extends StatefulWidget {
  const NewPacienteForm({Key? key}) : super(key: key);

  @override
  State<NewPacienteForm> createState() => _NewPacienteFormState();
}

class _NewPacienteFormState extends State<NewPacienteForm> {
  var pacienteNameController = TextEditingController();

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
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: MyTextField(
              hint: 'João Maria',
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
                  child: DropdownField(DropOpcoes: const [
                    'Masculino',
                    'Feminino',
                    'Masculino Trans',
                    'Feminino Trans'
                  ], hint: 'Genero'),
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
                  child: DropdownField(DropOpcoes: const [
                    'A+',
                    'B+',
                    'AB+',
                    'O+',
                    'A-',
                    'B-',
                    'AB-',
                    'O-'
                  ], hint: 'AB-'),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: NumberField(
              suffix: 'KG',
              fieldName: 'Peso',
              hint: "70.45",
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: NumberField(
              suffix: 'Metros',
              fieldName: 'Altura',
              hint: "1.70",
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
                      DropOpcoes: const ['Sim', 'Não'], hint: '???'),
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
                      DropOpcoes: const ['Sim', 'Não'], hint: '???'),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: NumberField(
              suffix: 'Centimetros',
              fieldName: 'Circunferência Abdominal',
              hint: "101,5",
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //chamar o post paciente
        },
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 28,
        ),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
