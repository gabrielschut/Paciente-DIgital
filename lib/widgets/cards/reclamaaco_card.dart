import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paciente_digital/Utils/ProjectUtils.dart';
import 'package:paciente_digital/model/afericoes/reclamacoes.dart';
import 'package:paciente_digital/db/reclamacoes_repository.dart';

class ReclamacoesCard extends StatefulWidget {
  final Reclamacoes reclamacao;
  final VoidCallback onExclude;
  const ReclamacoesCard({Key? key, required this.reclamacao, required this.onExclude}) : super(key: key);

  @override
  State<ReclamacoesCard> createState() => _ReclamacoesCardState();
}

ReclamacoesRepository reclamacoesRepository = ReclamacoesRepository();

class _ReclamacoesCardState extends State<ReclamacoesCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
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
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Text(
                          "Feita em : ${DateFormat("dd/MM/yyyy").format(ProjectUtils.intToDateTime(widget.reclamacao.createAt))}",
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      reclamacoesRepository.delete(widget.reclamacao.id);
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
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 260,
                      child: Text(
                        widget.reclamacao.reclamacao != ""
                            ? widget.reclamacao.reclamacao
                            : "Descrição não informada",
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
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
