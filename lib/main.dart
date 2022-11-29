import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paciente_digital/db/database_service.dart';
import 'package:paciente_digital/screens/paciente/pacientes_select.dart';
import 'package:paciente_digital/theme/paciente_digital_input_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DataBaseService().init());
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

      initialRoute: '/',
      routes: {
        '/': (context) =>  PacienteSelect(),
      },
    );
  }
}
