import 'package:flutter/material.dart';
import 'package:paciente_digital/model/afericoes/glicemia.dart';
import 'package:paciente_digital/model/afericoes/pressao_arterial.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/screens/afericoes/glicemia/list_glicemia.dart';
import 'package:paciente_digital/screens/afericoes/pressao_arterial/list_pressao_arterial.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        inputDecorationTheme: PacienteDIgitalInputTheme().theme(),
      ),
      home:  ListPressaoArterial(pressoes: [
        PressaoArterial(idPaciente: 1, createAt: DateTime(2022,01,25), maxima: 120, minima: 80)
      ],paienteName: "Gabriel"),
    );
  }
}
