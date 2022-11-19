import 'package:flutter/material.dart';
import 'package:paciente_digital/screens/afericoes/frequencia_cardiaca/new_freq_cardiaca_screen.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        inputDecorationTheme: PacienteDIgitalInputTheme().theme(),
      ),
      home: NewFreqCardiaca(),
    );
  }
}
