import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paciente_digital/controller/paciente_controller.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';

class NewPacienteForm extends GetView<PacienteController> {
  @override
  final controller = Get.find<PacienteController>();

  NewPacienteForm({super.key});

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
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: MyTextField(
                hint: 'João Maria',
                fieldName: 'Nome',
                suffix: 'abc',
                controller: controller.nameController,
                focusNode: controller.nameFocusNode,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: NumberField(
                suffix: 'Anos',
                fieldName: 'Idade',
                hint: "30",
                controller: controller.ageController,
                focusNode: controller.ageFocusNode,
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
                      controller: controller.sexController,
                      focusNode: controller.sexFocusNode,
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
                      controller: controller.bloodTypeController,
                      focusNode: controller.bloodTypeFocusNode,
                      fieldName: "Tipo sang.",
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
                controller: controller.wightController,
                focusNode: controller.wightFocusNode,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: NumberField(
                suffix: 'Metros',
                fieldName: 'Altura',
                hint: "1.70",
                controller: controller.heightController,
                focusNode: controller.heightFocusNode,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: NumberField(
                suffix: 'Centimetros',
                fieldName: 'Circunferência Abdominal',
                hint: "101,5",
                controller: controller.circAbdominalCOntroller,
                focusNode: controller.circAbdominalFocusNode,
              ),
            ),
            FloatingActionButton(
              onPressed: () async {
                controller.savePaciente();
                controller.nameController.text = "";
                controller.ageController.text = "";
                controller.sexController.text = "";
                controller.bloodTypeController.text = "";
                controller.wightController.text = "";
                controller.heightController.text = "";
                controller.circAbdominalCOntroller.text = "";
                Navigator.pop(context);
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
