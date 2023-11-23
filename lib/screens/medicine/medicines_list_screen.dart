import 'package:flutter/material.dart';
import 'package:paciente_digital/model/tab_paciente_entitie.dart';
import 'package:paciente_digital/widgets/cards/medicine_card.dart';
import 'package:paciente_digital/db/medicamento_repository.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';

class MedicinesListScreen extends StatefulWidget {
  final TabPacienteEntitie entitie;

  const MedicinesListScreen({
    super.key,
    required this.entitie,
  });

  @override
  State<StatefulWidget> createState() => _MedicinesListState();
}

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
            builder: (context) => AlertDialog(
              title: const Text(
                'Novo medicamento',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: MyTextField(
                            hint: 'Doril',
                            fieldName: 'Nome',
                            suffix: 'abc',
                            controller: nameController,
                            focusNode: nameFocusNode,
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
                                  controller: tarjaController,
                                  focusNode: tarjaFocusNode,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: NumberField(
                            focusNode: dosagemFocusNode,
                            fieldName: "Dosagem",
                            controller: dosagemController,
                            hint: "40.0 mg",
                            suffix: "mg | ml",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: DatePickerField(
                            hint: "01/01/2001",
                            dateFieldName: "data inicial",
                            suffix: "",
                            controller: initDateController,
                            focusNode: initDateFocusNode,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: NumberField(
                            focusNode: endDateFocusNode,
                            fieldName: "Dias usando",
                            controller: endDateController,
                            hint: "3",
                            suffix: "dias",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.cancel,
                                    color: Colors.red, size: 15),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  MedicamentoDatabaseHelper.create(
                                      widget.entitie.paciente.id,
                                      nameController.text,
                                      dosagemController.text as double,
                                      tarjaController.text,
                                      initDateController.text as DateTime,
                                      endDateController.text as int?);
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.check_circle,
                                  color: Colors.lightGreen,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
