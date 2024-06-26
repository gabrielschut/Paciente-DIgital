import 'package:flutter/material.dart';
import 'package:paciente_digital/db/medicamento_repository.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/model/tab_paciente_entitie.dart';
import 'package:paciente_digital/screens/tab_bar_paciente_controll_screen.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';
import 'package:paciente_digital/db/paciente_repository.dart';

class NewPacienteForm extends StatefulWidget {
  const NewPacienteForm({super.key});

  @override
  State<NewPacienteForm> createState() => _NewPacienteFormState();
}

MedicamentoRepository medicamentoDb = MedicamentoRepository();
PacienteRepository pacienteRepository = PacienteRepository();

Future<TabPacienteEntitie> _callDb() async {
  List<Medicamento> list = await medicamentoDb.listAll();

  return TabPacienteEntitie(
      paciente: await pacienteRepository.getPaciente(), medicamentos: list);
}

class _NewPacienteFormState extends State<NewPacienteForm> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    FocusNode nameFocusNode = FocusNode();
    TextEditingController idadeController = TextEditingController();
    FocusNode idadeFocusNode = FocusNode();
    TextEditingController sexoController = TextEditingController();
    FocusNode sexoFocusNode = FocusNode();
    TextEditingController tipoSanguineoController = TextEditingController();
    FocusNode tipoSanguineoFocusNode = FocusNode();
    TextEditingController pesoController = TextEditingController();
    FocusNode pesoFocusNode = FocusNode();
    TextEditingController alturaController = TextEditingController();
    FocusNode alturaFocusNode = FocusNode();
    TextEditingController circAbdominalController = TextEditingController();
    FocusNode circAbdominalFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Cadastro de novo paciente',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: MyTextField(
                  hint: 'João Maria',
                  fieldName: 'Nome',
                  suffix: 'abc',
                  controller: nameController,
                  focusNode: nameFocusNode),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: NumberField(
                suffix: 'Anos',
                fieldName: 'Idade',
                hint: "30",
                controller: idadeController,
                focusNode: idadeFocusNode,
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
                    child: MyTextField(
                      hint: "Masculino",
                      controller: sexoController,
                      focusNode: sexoFocusNode,
                      fieldName: "Sexo",
                      suffix: "",
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
                    child: MyTextField(
                      hint: "O+",
                      controller: tipoSanguineoController,
                      focusNode: tipoSanguineoFocusNode,
                      fieldName: "Tipo de sangue",
                      suffix: "",
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
                controller: pesoController,
                focusNode: pesoFocusNode,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: NumberField(
                suffix: 'Metros',
                fieldName: 'Altura',
                hint: "1.70",
                controller: alturaController,
                focusNode: alturaFocusNode,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: NumberField(
                suffix: 'Centimetros',
                fieldName: 'Circunferência Abdominal',
                hint: "101,5",
                controller: circAbdominalController,
                focusNode: circAbdominalFocusNode,
              ),
            ),
            FloatingActionButton(
              onPressed: () async {
                pacienteRepository.create(
                    nameController.text,
                    sexoController.text,
                    int.parse(idadeController.text),
                    tipoSanguineoController.text,
                    double.tryParse(pesoController.text),
                    double.tryParse(alturaController.text),
                    double.tryParse(circAbdominalController.text));
                TabPacienteEntitie entitie = await _callDb();
                nameController.clear();
                idadeController.clear();
                sexoController.clear();
                tipoSanguineoController.clear();
                pesoController.clear();
                alturaController.clear();
                circAbdominalController.clear();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TabBarPacienteControll(entitie: entitie),
                  ),
                );
              },
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 28,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
