import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paciente_digital/Utils/ProjectUtils.dart';
import 'package:paciente_digital/db/pressao_repository.dart';
import 'package:paciente_digital/model/afericoes/pressao_arterial.dart';

class PressaoArterialCard extends StatefulWidget {
  final PressaoArterial pressaoArterial;
  final VoidCallback onExclude;
  const PressaoArterialCard({
    Key? key,
    required this.pressaoArterial,
    required this.onExclude
  }) : super(key: key);

  @override
  State<PressaoArterialCard> createState() => _PressaoArterialCardState();
}

PressaoArterialRepository pressaoArterialRepository = PressaoArterialRepository();

class _PressaoArterialCardState extends State<PressaoArterialCard> {
  @override
  Widget build(BuildContext context) {
    String maxima = widget.pressaoArterial.maxima.toString();
    String minima = widget.pressaoArterial.minima.toString();
    return Container(
        width: 400,
        height: 110,
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Text(
                      "Maxima   $maxima",
                      style: const TextStyle(
                        color: Colors.blue,
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
                      pressaoArterialRepository.delete(widget.pressaoArterial.id);
                      widget.onExclude();
                    },
                    icon: const Icon(
                      Icons.close_sharp,
                      color: Colors.red,
                      size: 36,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:const EdgeInsets.only(left: 34),
                    child: Text(
                      "Minima    $minima",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34),
                child: Row(
                  children: [
                    Text(
                      "Aferido em : ${DateFormat("dd/MM/yyyy").format(ProjectUtils.intToDateTime(widget.pressaoArterial.createAt))}",
                      style: const TextStyle(
                        color: Colors.blue,
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
