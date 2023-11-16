// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:paciente_digital/screens/afericoes/eliminacoes/list_eliminacoes.dart';
import 'package:paciente_digital/screens/afericoes/freq_respiratoria/list_freq_respirat%C3%B3ria_screen.dart';
import 'package:paciente_digital/screens/afericoes/frequencia_cardiaca/list_freq_cardicada_screen.dart';
import 'package:paciente_digital/screens/afericoes/glicemia/list_glicemia.dart';
import 'package:paciente_digital/screens/afericoes/pressao_arterial/list_pressao_arterial.dart';
import 'package:paciente_digital/screens/afericoes/reclamacoes/list_reclamacoes_screen.dart';

class SelectAfericaoType extends StatefulWidget {
  int pacienteId;

  SelectAfericaoType({
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
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ListEliminacoes(pacienteId: widget.pacienteId,))
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
                            MaterialPageRoute(builder: (context) => ListFrequenciaCardiaca(
                              pacienteId: widget.pacienteId,
                            ))
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
                            MaterialPageRoute(builder: (context) =>  ListFrequenciaRespiratoria(pacienteId: widget.pacienteId))
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
                            MaterialPageRoute(builder: (context) => ListGlicemia(pacienteId: widget.pacienteId))
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
                            MaterialPageRoute(builder: (context) => ListPressaoArterial(pacienteId: widget.pacienteId))
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
                            MaterialPageRoute(builder: (context) =>  ListReclaacoesScreen(pacienteId: widget.pacienteId))
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
