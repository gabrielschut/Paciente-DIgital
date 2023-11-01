import 'package:flutter/material.dart';
import 'package:paciente_digital/db/database_service.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/theme/paciente_digital_input_theme.dart';
import 'package:paciente_digital/db/paciente_database_helper.dart';
import 'package:paciente_digital/screens/paciente/new_paciente_form_screen.dart';
import 'package:paciente_digital/screens/tabBar_paciente_controll_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseService.openDatabase();
  runApp(const PacienteDigital());
}


class PacienteDigital extends StatefulWidget {
  const PacienteDigital({Key? key}) : super(key: key);

  @override
  State<PacienteDigital> createState() => _PacienteDigitalState();
}

class _PacienteDigitalState extends State<PacienteDigital> {
  late Paciente paciente;
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        inputDecorationTheme: PacienteDIgitalInputTheme().theme(),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) =>  paciente.asStream().isEmpty? NewPacienteForm() : TabBarPacienteControll(entitie: paciente)
      },
    );
  }
}
