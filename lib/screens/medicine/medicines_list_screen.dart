import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/model/tab_paciente_entitie.dart';
import 'package:paciente_digital/screens/medicine/new_medicine_screen.dart';
import 'package:paciente_digital/widgets/cards/medicine_card.dart';
import 'package:paciente_digital/db/medicamento_database_helper.dart';

class MedicinesListScreen {

  @override

  final TabPacienteEntitie entitie;
  int id = 1;

  MedicinesListScreen({
    Key? key,
    required this.entitie,
  });

void removeDupliciti(List<Medicamento> medicamento){
  medicamento = medicamento.toSet().toList();
}

  @override
  Widget build(BuildContext context) {
    removeDupliciti(entitie.medicamentos);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 8, 8),
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
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
            child: entitie.medicamentos.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: MedicineCard(
                          medicine: entitie.medicamentos[index],
                        ),
                      );
                    },
                    itemCount: entitie.medicamentos.length,
                  )
                : Container(
                    child: const Center(
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
          Navigator.pushReplacementNamed(context, routeName));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

}