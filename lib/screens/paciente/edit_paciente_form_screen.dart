import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paciente_digital/controller/paciente_controller.dart';
import 'package:paciente_digital/string_extension.dart';

class EditPacienteForm extends GetView<PacienteController> {
  final controller = Get.find<PacienteController>();
  List<String> DropOpcoes = ["Sim", "Não"];
  ValueNotifier dropValue = ValueNotifier('');

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
                child: Flexible(
                  child: TextFormField(
                    controller: controller.nameController,
                    focusNode: controller.nameFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (String string) {
                      controller.nameFocusNode.requestFocus();
                    },
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      helperText: "",
                      hintText: "João Maria",
                      labelText: "nome",
                      labelStyle: const TextStyle(
                        color: Colors.lightBlue,
                      ),
                      suffixText: "abc",
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Flexible(
                  child: TextFormField(
                    controller: controller.sexController,
                    focusNode: controller.sexFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (String string) {
                      controller.sexFocusNode.requestFocus();
                    },
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      helperText: "",
                      hintText: "Masculino",
                      labelText: "Genero",
                      labelStyle: const TextStyle(
                        color: Colors.lightBlue,
                      ),
                      suffixText: "abc",
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Flexible(
                  child: TextFormField(
                    controller: controller.bloodTypeController,
                    focusNode: controller.bloodTypeFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (String string) {
                      controller.bloodTypeFocusNode.requestFocus();
                    },
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      helperText: "",
                      hintText: "AB+",
                      labelText: "Tipo sanguíneo",
                      labelStyle: const TextStyle(
                        color: Colors.lightBlue,
                      ),
                      suffixText: "abc",
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: TextFormField(
                  controller: controller.wightController,
                  focusNode: controller.wightFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (String string) {
                    controller.wightFocusNode.requestFocus();
                  },
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                  validator: (s) {
                    if (!s!.isValidDouble() || s.isValidInt()) {
                      return "Valor inválido";
                    } else {
                      return null;
                    }
                  },
                  maxLength: 6,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    labelText: "Peso",
                    labelStyle: TextStyle(
                      color: Colors.lightBlue,
                    ),
                    helperText: "",
                    hintText: "80.5",
                    suffixText: "Kg",
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: TextFormField(
                  controller: controller.heightController,
                  focusNode: controller.heightFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (String string) {
                    controller.heightFocusNode.requestFocus();
                  },
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                  validator: (s) {
                    if (!s!.isValidDouble() || s.isValidInt()) {
                      return "Valor inválido";
                    } else {
                      return null;
                    }
                  },
                  maxLength: 6,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    labelText: "Altura",
                    labelStyle: TextStyle(
                      color: Colors.lightBlue,
                    ),
                    helperText: "",
                    hintText: "1.70",
                    suffixText: "Metros",
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: TextFormField(
                  controller: controller.circAbdominalCOntroller,
                  focusNode: controller.circAbdominalFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (String string) {
                    controller.circAbdominalFocusNode.requestFocus();
                    if (controller.loading.value == true) {
                      Get.dialog(Center(child: CircularProgressIndicator()));
                    }
                  },
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                  validator: (s) {
                    if (!s!.isValidDouble() || s.isValidInt()) {
                      return "Valor inválido";
                    } else {
                      return null;
                    }
                  },
                  maxLength: 6,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    labelText: "Circ. Abdominal",
                    labelStyle: TextStyle(
                      color: Colors.lightBlue,
                    ),
                    helperText: "",
                    hintText: "90.2",
                    suffixText: "Centimetros",
                  ),
                )),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          controller.editUpdateMode();
          if (controller.loading.value == true) {
            Get.dialog(Center(child: CircularProgressIndicator()));
          }
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

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      );
}
