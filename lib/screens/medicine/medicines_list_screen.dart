import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paciente_digital/controller/medicamento_controller.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/screens/medicine/new_medicine_screen.dart';
import 'package:paciente_digital/widgets/cards/medicine_card.dart';

class MedicinesListScreen extends GetView<MedicamentoController> {

  @override
  final controller = Get.find<MedicamentoController>();

  final int idPaciente;
  final List<Medicamento> medicines;

  MedicinesListScreen({
    Key? key,
    required this.medicines,
    required this.idPaciente
  }) : super(key: key);

void removeDupliciti(List<Medicamento> medicamento){
  medicamento = medicamento.toSet().toList();
}


  @override
  Widget build(BuildContext context) {
    removeDupliciti(medicines);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 8, 8),
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            shape: BoxShape.rectangle,
            border: Border(
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
            child: medicines.length > 0
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: MedicineCard(
                          medicine: medicines[index],
                        ),
                      );
                    },
                    itemCount: medicines.length,
                  )
                : Container(
                    child: Center(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NewMedicine(idPaciente: idPaciente))
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