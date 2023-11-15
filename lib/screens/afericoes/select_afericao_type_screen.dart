import 'package:flutter/material.dart';
import 'package:paciente_digital/model/afericoes/eliminacoes.dart';
import 'package:paciente_digital/screens/afericoes/eliminacoes/list_eliminacoes.dart';
import 'package:paciente_digital/screens/afericoes/freq_respiratoria/list_freq_respirat%C3%B3ria_screen.dart';
import 'package:paciente_digital/screens/afericoes/frequencia_cardiaca/list_freq_cardicada_screen.dart';
import 'package:paciente_digital/screens/afericoes/glicemia/list_glicemia.dart';
import 'package:paciente_digital/screens/afericoes/pressao_arterial/list_pressao_arterial.dart';
import 'package:paciente_digital/screens/afericoes/reclamacoes/list_reclamacoes_screen.dart';
import 'package:paciente_digital/db/eliminacoes_database_helper.dart';
import 'package:paciente_digital/db/frequenci_respiratoria_database_helper.dart';
import 'package:paciente_digital/db/frequencia_cardiaca_database_helper.dart';
import 'package:paciente_digital/db/glicemia_database_helper.dart';
import 'package:paciente_digital/db/pressao_arterial_database_helper.dart';
import 'package:paciente_digital/db/reclamacoes_database_helper.dart';


class SelectAfericaoType extends StatefulWidget {
  final int pacienteId;
  const SelectAfericaoType({
    Key? key,
    required this.pacienteId
  }) : super(key: key);

  @override
  State<SelectAfericaoType> createState() => _SelectAfericaoTypeState();
}

class _SelectAfericaoTypeState extends State<SelectAfericaoType> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            shape: BoxShape.rectangle,
            border: const Border(
              top: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
              right: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
              left: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
              bottom: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
            ),
          ),
          height: 580,
          width: 380,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 36, 0, 10),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.blueAccent,
                    ),
                    child: TextButton(
                      onPressed: () async {
                        List<Eliminacoes> listEliminacoes = await EliminacoesDatabaseHelper.getList();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ListEliminacoes(listEsliminacoes: listEliminacoes))
                        );
                      },
                      child: const Text(
                        "Eliminações",
                        style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 10),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.blueAccent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const ListFrequenciaCardiaca())
                        );
                      },
                      child: const Text(
                        "Freq. Cardíaca",
                        style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 10),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.blueAccent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const ListFrequenciaRespiratoria(frequencias: [],))
                        );
                      },
                      child: const Text(
                        "Frequência Respiratória",
                        style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 10),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.blueAccent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const ListGlicemia())
                        );
                      },
                      child: const Text(
                        "Glicemia",
                        style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 10),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.blueAccent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ListPressaoArterial(pressoes: [],))
                        );
                      },
                      child: const Text(
                        "Pressão Arterial",
                        style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 10),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.blueAccent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const ListReclaacoesScreen())
                        );
                      },
                      child: const Text(
                        "Reclamações",
                        style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
