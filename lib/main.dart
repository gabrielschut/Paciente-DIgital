import 'package:flutter/material.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/screens/paciente/paciente_info_screen.dart';
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
  Paciente paciente = Paciente(
    id: 1,
    nome: "Gabriel",
    sobrenome: "Schutt",
    sexo: "Masculino",
    diabetis: false,
    cardiaco: false,
    idade: 26,
    tipoSanguineo: null,
    peso: null,
    isActive: true,
    circunferenciaAbdominal: 72.05,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        inputDecorationTheme: PacienteDIgitalInputTheme().theme(),
      ),
      home: PacienteInfo(paciente: paciente,),
    );
  }
}
