import 'package:flutter/material.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/repository/paciente_repository.dart';
import 'package:paciente_digital/widgets/components/dropdown_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';

class NewPacienteForm extends StatefulWidget {
  const NewPacienteForm({Key? key}) : super(key: key);

  @override
  State<NewPacienteForm> createState() => _NewPacienteFormState();
}

class _NewPacienteFormState extends State<NewPacienteForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController wightController = TextEditingController();
  TextEditingController diabetisController = TextEditingController();
  TextEditingController cardiacoController = TextEditingController();
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
                    controller: cardiacoController,
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
        onPressed: () async {
          Paciente paciente = Paciente(
            nome: nameController.text,
            cardiaco: cardiacoController.text == "Sim" ? true : false,
            sexo: sexController.text,
            diabetis: diabetisController.text == "Sim" ? true : false,
            idade: int.parse(ageController.text),
            circunferenciaAbdominal:
                double.tryParse(circAbdominalCOntroller.text),
            tipoSanguineo: bloodTypeController.text,
            peso: double.tryParse(wightController.text),
            altura: double.tryParse(heightController.text),
          );
          PacienteRepository.INSTANCE.create(paciente);
          setState(() {
            nameController.clear();
            cardiacoController.clear();
            sexController.clear();
            diabetisController.clear();
            ageController.clear();
            circAbdominalCOntroller.clear();
            bloodTypeController.clear();
            wightController.clear();
            heightController.clear();
          });
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
