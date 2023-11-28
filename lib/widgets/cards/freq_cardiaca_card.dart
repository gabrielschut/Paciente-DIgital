import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paciente_digital/Utils/ProjectUtils.dart';
import 'package:paciente_digital/model/afericoes/frequencia_cardiaca.dart';
import 'package:paciente_digital/db/frequencia_cardiaca_repository.dart';

class CardFreqCardiaca extends StatefulWidget {
  final FrenquenciaCardiaca frenquenciaCardiaca;

  const CardFreqCardiaca({
    Key? key,
    required this.frenquenciaCardiaca,
  }) : super(key: key);

  @override
  State<CardFreqCardiaca> createState() => _CardFreqCardiacaState();
}

FrequenciaCardiacaRepository frequenciaCardiacaRepository = FrequenciaCardiacaRepository();

class _CardFreqCardiacaState extends State<CardFreqCardiaca> {
  @override
  Widget build(BuildContext context) {
    String frequencia = widget.frenquenciaCardiaca.frequencia.toString();
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
                      "$frequencia Batimentos /min",
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
                      frequenciaCardiacaRepository.delete(widget.frenquenciaCardiaca.id);
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
                    Text("Aferido em : ${DateFormat("dd/MM/yyyy").format(ProjectUtils.intToDateTime(widget.frenquenciaCardiaca.createAt))}",
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
