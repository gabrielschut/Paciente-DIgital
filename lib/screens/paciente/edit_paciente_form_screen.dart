// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';
import 'package:paciente_digital/db/paciente_repository.dart';

class EditPacienteForm extends StatefulWidget {
  Paciente paciente;
  EditPacienteForm({Key? key, required this.paciente}): super(key: key);

  @override
  State<StatefulWidget> createState() => _EditPacienteFormState();
}

PacienteRepository pacienteRepository = PacienteRepository();

class _EditPacienteFormState extends State<EditPacienteForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController sexoController = TextEditingController();
  TextEditingController tipoSanguineoController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController circAbdominalController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode idadeFocusNode = FocusNode();
  FocusNode sexoFocusNode = FocusNode();
  FocusNode tipoSanguineoFocusNode = FocusNode();
  FocusNode pesoFocusNode = FocusNode();
  FocusNode alturaFocusNode = FocusNode();
  FocusNode circAbdominalFocusNode = FocusNode();

  clearControllers(){
    nameController.clear();
    idadeController.clear();
    sexoController.clear();
    tipoSanguineoController.clear();
    pesoController.clear();
    alturaController.clear();
    circAbdominalController.clear();
  }

  @override
  Widget build(BuildContext context) {

    nameController.text = widget.paciente.nome;
    idadeController.text = widget.paciente.idade.toString();
    sexoController.text = widget.paciente.sexo;
    tipoSanguineoController.text = widget.paciente.tipoSanguineo!;
    pesoController.text = widget.paciente.peso.toString();
    alturaController.text = widget.paciente.altura.toString();
    circAbdominalController.text = widget.paciente.circunferenciaAbdominal.toString();

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
                focusNode: nameFocusNode,
              ),
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
                pacienteRepository.update(
                    widget.paciente.id,
                    nameController.text,
                    sexoController.text,
                    int.parse(idadeController.text),
                    tipoSanguineoController.text,
                    double.parse(pesoController.text),
                    double.parse(alturaController.text),
                    double.parse(circAbdominalController.text));
                Paciente updatePaciente = Paciente(id: widget.paciente.id,
                    nome: nameController.text,
                    sexo: sexoController.text,
                    idade: int.parse(idadeController.text),
                    tipoSanguineo: tipoSanguineoController.text,
                    peso: double.parse(pesoController.text),
                    altura: double.parse(alturaController.text),
                    circunferenciaAbdominal: double.parse(circAbdominalController.text)
                );
                widget.paciente = updatePaciente;
                clearControllers();
                Navigator.pop(context);
              },
              backgroundColor: Colors.indigo,
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
