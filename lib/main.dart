import 'package:flutter/material.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/screens/medicine/medicines_list_screen.dart';
import 'package:paciente_digital/theme/paciente_digital_input_theme.dart';

void main() {
  runApp(const PacienteDigital());
}

class PacienteDigital extends StatefulWidget {
  const PacienteDigital({Key? key}) : super(key: key);

  @override
  State<PacienteDigital> createState() => _PacienteDigitalState();
}

class _PacienteDigitalState extends State<PacienteDigital> {
  final List<Medicamento> medicamentos = [];
  @override
  Widget build(BuildContext context) {
    final Medicamento medicamento = new Medicamento(idPaciente: 1,
        id: 1,
        nome: "Dipirona",
        dosagem: 60.0,
        dataInicial: DateTime(2022,12,1),
        dataTermino: DateTime(2023, 1, 20));

    final Medicamento medicamento2 = new Medicamento(idPaciente: 1,
        id: 2,
        nome: "Dramin",
        dosagem: 60.0,
        dataInicial: DateTime(2022,12,1),
        dataTermino: DateTime(2023, 1, 20));
    medicamentos.addAll([medicamento,medicamento2]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        inputDecorationTheme: PacienteDIgitalInputTheme().theme(),
      ),
      home: MedicinesListScreen(medicines: medicamentos,paienteName: "Gabriel schutt"),
    );
  }
}
