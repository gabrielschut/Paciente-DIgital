import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paciente_digital/controller/medicamento_controller.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';

class NewMedicine extends GetView<MedicamentoController> {
  @override
  final controller = Get.find<MedicamentoController>();

  final int idPaciente;

  NewMedicine({
    Key? key,
    required this.idPaciente,
  }) : super(key: key);

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
              controller: controller.nomeController,
              focusNode: controller.nomeFocusNode,
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
                  child: MyTextField(
                    hint: 'Preta',
                    fieldName: 'Tarja',
                    suffix: 'abc',
                    controller: controller.tarjaController,
                    focusNode: controller.tarjaFocusNode,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: NumberField(
              focusNode: controller.dosagemFocusNode,
              fieldName: "Dosagem",
              controller: controller.dosagemController,
              hint: "40.0 mg",
              suffix: "mg | ml",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: DatePickerField(
              hint: "01/01/2001",
              dateFieldName: "data inicial",
              suffix: "",
              controller: controller.dataInicialController,
              focusNode: controller.dataInicialFocusNode,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: DatePickerField(
              hint: "01/01/2001",
              dateFieldName: "data final",
              suffix: "",
              controller: controller.dataTerminoController,
              focusNode: controller.dataTerminoFocusNode,
            ),
          ),
          FloatingActionButton(
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              //chamar o save medicine
            },
          ),
        ],
      ),
    );
  }
}
