import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paciente_digital/Utils/ProjectUtils.dart';
import 'package:paciente_digital/model/afericoes/frequencia_respiratoria.dart';
import 'package:paciente_digital/db/frequenci_respiratoria_repository.dart';

class CardFrequenciaRespiratoria extends StatefulWidget {
  final FrequenciaRespiratoria frequenciaRespiratoria;
  final VoidCallback onExclude;
  const CardFrequenciaRespiratoria({
    Key? key,
    required this.frequenciaRespiratoria,
    required this.onExclude
  }) : super(key: key);

  @override
  State<CardFrequenciaRespiratoria> createState() => _CardFrequenciaRespiratoriaState();
}

FrequenciaRespiratoriaRepository frequenciaRespiratoriaRepository = FrequenciaRespiratoriaRepository();

class _CardFrequenciaRespiratoriaState extends State<CardFrequenciaRespiratoria> {
  @override
  Widget build(BuildContext context) {
    String frequencia = widget.frequenciaRespiratoria.frequencia.toString();
    return Container(
        width: 400,
        height: 82,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          shape: BoxShape.rectangle,
          border: const Border(
            top: BorderSide(
              width: 1,
              color: Colors.lightBlue,
            ),
            right: BorderSide(
              width: 1,
              color: Colors.lightBlue,
            ),
            left: BorderSide(
              width: 1,
              color: Colors.lightBlue,
            ),
            bottom: BorderSide(
              width: 1,
              color: Colors.lightBlue,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 4, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Text(
                      "$frequencia Respirações /min",
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  IconButton(
                    onPressed: () {
                      frequenciaRespiratoriaRepository.delete(widget.frequenciaRespiratoria.id);
                      widget.onExclude();
                    },
                    icon: const Icon(
                      Icons.close_sharp,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 8),
                child: Row(
                  children: [
                    Text(
                      "Aferido em : ${DateFormat("dd/MM/yyyy").format(ProjectUtils.intToDateTime(widget.frequenciaRespiratoria.createAt))}",
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
