import 'package:flutter/material.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/screens/medicine/new_medicine_screen.dart';
import 'package:paciente_digital/widgets/cards/medicine_card.dart';

class MedicinesListScreen extends StatefulWidget {
  final List<Medicamento> medicines;

  const MedicinesListScreen({
    Key? key,
    required this.medicines,
  }) : super(key: key);

  @override
  State<MedicinesListScreen> createState() => _MedicinesListScreenState();
}

void removeDupliciti(List<Medicamento> medicamento){
  medicamento = medicamento.toSet().toList();
}

class _MedicinesListScreenState extends State<MedicinesListScreen> {
  @override
  Widget build(BuildContext context) {
    removeDupliciti(widget.medicines);
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
            child: widget.medicines.length > 0
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: MedicineCard(
                          medicine: widget.medicines[index],
                        ),
                        onTap: () => removeDupliciti(widget.medicines),
                      );
                    },
                    itemCount: widget.medicines.length,
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
              MaterialPageRoute(builder: (context) => NewMedicine())
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