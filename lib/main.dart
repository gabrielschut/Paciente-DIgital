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
  late List<Map<String, dynamic>> pacientes;
  late List<Medicamento> medicamentos;

  Future<void> _refreshPaciente() async {
    final List<Map<String, dynamic>> pacientes =
        await PacienteDatabaseHelper.getAll();
    setState(() {
      paciente = Paciente(
          id: pacientes[1]['id'],
          nome: pacientes[1]['nome'],
          sexo: pacientes[1]['sexo'],
          idade: pacientes[1]['idade'],
          altura: pacientes[1]['altura'],
          peso: pacientes[1]['peso'],
          tipoSanguineo: pacientes[1]['tipo_sanguineo'],
          circunferenciaAbdominal: pacientes[1]['circunferencia_abdominal']);
    });
  }

  Future<void> _refreshMedicines() async {
    final List<Map<String, dynamic>> medicineList =
        await MedicamentoDatabaseHelper.getAll();
    setState(() {
      if (medicineList.isNotEmpty) {
        for (Map<String, dynamic> item in medicineList) {
          medicamentos.add(Medicamento(
              id: item['id'],
              idPaciente: item['paciente_id'],
              nome: item['nome'],
              dosagem: item['dosagem'],
              tarja: item['tarja'],
              dataInicial: item['dataInicial'],
              diasDeUso: item['dias_de_uso'])
          );
        }
      }
    });
  }

  checkIfPacienteExist() async {
    if(pacientes.isEmpty){
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
