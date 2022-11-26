import 'package:flutter/material.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/screens/paciente/pacientes_select.dart';
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
  @override
  Widget build(BuildContext context) {

    Paciente paciente = Paciente(
        nome: "Gabriel Braz",
        sexo: "Masculino",
        idade: 26,
        diabetis: true,
        cardiaco: false);
    Paciente paciente1 = Paciente(
        nome: "Gabriel Filho",
        sexo: "Masculino",
        idade: 26,
        diabetis: false,
        cardiaco: true);
    Paciente paciente2 = Paciente(
        nome: "Gabriel Silva",
        sexo: "Masculino",
        idade: 26,
        diabetis: true,
        cardiaco: true);
    Paciente paciente3 = Paciente(
        nome: "Gabriel Almeida",
        sexo: "Masculino",
        idade: 26,
        diabetis: false,
        cardiaco: false);
    List<Paciente> pacientes = [];
    pacientes.addAll([paciente, paciente1, paciente2, paciente3]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        inputDecorationTheme: PacienteDIgitalInputTheme().theme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>  PacienteSelect(pacientes: pacientes),
      },
    );
  }
}
