import 'package:flutter/material.dart';
import 'package:paciente_digital/db/database_service.dart';
import 'package:paciente_digital/theme/paciente_digital_input_theme.dart';
import 'package:paciente_digital/screens/paciente/new_paciente_form_screen.dart';
import 'package:paciente_digital/screens/init_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseService.database();
  runApp(const PacienteDigital());
}

class PacienteDigital extends StatefulWidget {
  const PacienteDigital({Key? key}) : super(key: key);

  @override
  State<PacienteDigital> createState() => _PacienteDigitalState();
}

class _PacienteDigitalState extends State<PacienteDigital> {
  @override
  void initState() {
    super.initState();
  }

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
        '/newPaciente' : (context) => NewPacienteForm(),
        '/': (context) => const InitScreen(),
      },
    );
  }
}
