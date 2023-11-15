import 'package:flutter/material.dart';
import 'package:paciente_digital/db/database_service.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/model/tab_paciente_entitie.dart';
import 'package:paciente_digital/theme/paciente_digital_input_theme.dart';
import 'package:paciente_digital/db/paciente_database_helper.dart';
import 'package:paciente_digital/db/medicamento_database_helper.dart';
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
  @override
  void initState() {
    super.initState();
    _refreshPaciente();
    _refreshMedicines();
    checkIfPacienteExist();
  }

  late Paciente paciente;
  late List<Medicamento> medicamentos;

  Future<void> _refreshPaciente() async {
    setState(() async {
      paciente = await PacienteDatabaseHelper.getPaciente();
    });
  }

  Future<void> _refreshMedicines() async {
    setState(() async {
        medicamentos = await MedicamentoDatabaseHelper.listAll();
    });
  }

  checkIfPacienteExist() async {
    if(paciente.id != 0){
      Navigator.pushReplacementNamed(context, '/');
    }else{
      Navigator.pushReplacementNamed(context, '/novoPaciente');
    }
  }

  @override
  Widget build(BuildContext context) {
    late TabPacienteEntitie entitie = TabPacienteEntitie(paciente: paciente, medicamentos: medicamentos);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        inputDecorationTheme: PacienteDIgitalInputTheme().theme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabBarPacienteControll(entitie: entitie).build(context),
        '/novoPaciente': (context) => NewPacienteForm().build(context),
      },
    );
  }
}
