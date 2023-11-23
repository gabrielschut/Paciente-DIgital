import 'package:flutter/material.dart';
import 'package:paciente_digital/db/database_service.dart';
import 'package:paciente_digital/db/medicamento_repository.dart';
import 'package:paciente_digital/db/paciente_repository.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/model/tab_paciente_entitie.dart';
import 'package:paciente_digital/screens/tab_bar_paciente_controll_screen.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();

}

Future<TabPacienteEntitie> _callDb() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseService.openDatabase();
  MedicamentoDatabaseHelper medicamentoDb = MedicamentoDatabaseHelper();
  return TabPacienteEntitie(paciente: await PacienteDatabaseHelper.getPaciente(), medicamentos: await medicamentoDb.listAll());
}

class _InitScreenState extends State<InitScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 0, 0),
        child: Container(
          padding: const EdgeInsets.all(0),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
          ),
          height: 840,
          width: 380,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Container(
                    width: 420,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 540,
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "Paciente Digital",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 30,
                                decoration: TextDecoration.none),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 25),
                          child: Text(
                            "Organizando as suas informações sobre a sua saúde!",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 65,
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                TabPacienteEntitie entitie = await _callDb();
                                if (entitie.paciente.id != 0) {
                                  Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                        builder: (_) => TabBarPacienteControll(entitie: entitie),
                                    ),
                                  );
                                }else {
                                  Navigator.pushNamed(context, '/newPaciente');
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (states) {
                                  return Colors.lightBlue;
                                }),
                              ),
                              child: const Text(
                                "Entrar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
