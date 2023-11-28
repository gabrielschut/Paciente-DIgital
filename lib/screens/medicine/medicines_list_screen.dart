import 'package:flutter/material.dart';
import 'package:paciente_digital/model/tab_paciente_entitie.dart';
import 'package:paciente_digital/widgets/cards/medicine_card.dart';
import 'package:paciente_digital/db/medicamento_repository.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';
import 'package:paciente_digital/Utils/ProjectUtils.dart';

class MedicinesListScreen extends StatefulWidget {
  final TabPacienteEntitie entitie;

  const MedicinesListScreen({
    super.key,
    required this.entitie,
  });

  @override
  State<StatefulWidget> createState() => _MedicinesListState();
}

MedicamentoRepository medicamentoRepository = MedicamentoRepository();

class _MedicinesListState extends State<MedicinesListScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController tarjaController = TextEditingController();
  TextEditingController initDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController dosagemController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode tarjaFocusNode = FocusNode();
  FocusNode initDateFocusNode = FocusNode();
  FocusNode endDateFocusNode = FocusNode();
  FocusNode dosagemFocusNode = FocusNode();

  cleanControllers(){
    nameController.clear();
    tarjaController.clear();
    initDateController.clear();
    endDateController.clear();
    dosagemController.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            shape: BoxShape.rectangle,
            border: const Border(
              top: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
              right: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
              left: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
              bottom: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
            ),
          ),
          height: 550,
          width: 800,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: widget.entitie.medicamentos.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: MedicineCard(
                          medicine: widget.entitie.medicamentos[index],
                        ),
                      );
                    },
                    itemCount: widget.entitie.medicamentos.length,
                  )
                : const Center(
                    child: Text(
                      "Nenhum medicamento cadastrado",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                      ),
                    ),
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => novoMedicamentoPopUp());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  AlertDialog novoMedicamentoPopUp(){
    return AlertDialog(
      title: const Padding(
        padding: EdgeInsets.fromLTRB(32, 8, 0, 0),
        child: Text(
          'Novo medicamento',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue,
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 12, 0),
                  child: MyTextField(
                    hint: 'Doril',
                    fieldName: 'Nome',
                    suffix: 'abc',
                    controller: nameController,
                    focusNode: nameFocusNode,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 252,
                      child: MyTextField(
                        hint: 'Preta',
                        fieldName: 'Tarja',
                        suffix: 'abc',
                        controller: tarjaController,
                        focusNode: tarjaFocusNode,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: NumberField(
                    focusNode: dosagemFocusNode,
                    fieldName: "Dosagem",
                    controller: dosagemController,
                    hint: "40.0 mg",
                    suffix: "mg | ml",
                  ),
                ),
                DatePickerField(
                  hint: "01/01/2001",
                  dateFieldName: "data inicial",
                  suffix: "",
                  controller: initDateController,
                  focusNode: initDateFocusNode,
                ),
                SizedBox(
                  width: 252,
                  child: NumberField(
                    focusNode: endDateFocusNode,
                    fieldName: "Dias de uso",
                    controller: endDateController,
                    hint: "3",
                    suffix: "dias",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 42,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty
                                .resolveWith<Color?>((states) {
                              return Colors.redAccent.shade200;
                            }),
                          ),
                          onPressed: () {
                            cleanControllers();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      SizedBox(
                        width: 120,
                        height: 42,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty
                                .resolveWith<Color?>((states) {
                              return Colors.green.shade300;
                            }),
                          ),
                          onPressed: () async {
                            medicamentoRepository.create(
                                widget.entitie.paciente.id,
                                nameController.text,
                                double.parse(dosagemController.text),
                                tarjaController.text,
                                ProjectUtils.convertUsinEphoch(initDateController.text),
                                int.parse(endDateController.text));
                            cleanControllers();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Salvar",
                            style: TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
