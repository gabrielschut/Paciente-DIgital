import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paciente_digital/Utils/ProjectUtils.dart';
import 'package:paciente_digital/db/medicamento_repository.dart';
import 'package:paciente_digital/model/medicamento.dart';

class MedicineCard extends StatefulWidget {
  final Medicamento medicine;
  final VoidCallback onExclude;
  const MedicineCard({Key? key, required this.medicine,
  required this.onExclude}) : super(key: key);

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

MedicamentoRepository medicamentoRepository = MedicamentoRepository();

class _MedicineCardState extends State<MedicineCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Container(
        width: 400,
        height: 120,
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
          padding: const EdgeInsets.fromLTRB(0, 4, 4, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(
                      widget.medicine.nome,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          medicamentoRepository.delete(widget.medicine.id);
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Dosagem ",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${widget.medicine.dosagem}",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Início: ",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 42,
                        ),
                        Text("${DateFormat("dd/MM/yyyy").format(ProjectUtils.intToDateTime(widget.medicine.dataInicial))}",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Tempo de uso ${widget.medicine.diasDeUso} dias",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
