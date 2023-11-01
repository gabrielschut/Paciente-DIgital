import 'package:flutter/material.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';
import 'package:paciente_digital/db/paciente_database_helper.dart';

class EditPacienteForm {
  final paciente = PacienteDatabaseHelper.get(1);

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
                PacienteDatabaseHelper.update(1,
                    nameController.text, sexoController.text,
                    idadeController.value as int, tipoSanguineoController.text, pesoController.value as double?,
                    alturaController.text as int?, circAbdominalController.text as double?);
                nameController.clear();
                idadeController.clear();
                sexoController.clear();
                tipoSanguineoController.clear();
                pesoController.clear();
                alturaController.clear();
                circAbdominalController.clear();
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
