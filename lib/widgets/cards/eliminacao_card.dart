import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paciente_digital/Utils/ProjectUtils.dart';
import 'package:paciente_digital/model/afericoes/eliminacoes.dart';
import 'package:paciente_digital/db/eliminacoes_repository.dart';

class EliminacaoCard extends StatefulWidget {
  final Eliminacoes eliminacao;

  const EliminacaoCard({
    Key? key,
    required this.eliminacao,
  }) : super(key: key);

  @override
  State<EliminacaoCard> createState() => _EliminacaoCardState();
}

EliminacoesRepository eliminacoesRepository = EliminacoesRepository();

class _EliminacaoCardState extends State<EliminacaoCard> {
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
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      widget.eliminacao.excrecao != null
                          ? widget.eliminacao.excrecao.toString()
                          : "Eliminação",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      eliminacoesRepository.delete(widget.eliminacao.id);
                    },
                    icon: const Icon(
                      Icons.close_sharp,
                      color: Colors.red,
                      size: 36,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      const Text("Data :",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(DateFormat("dd/MM/yyyy").format(ProjectUtils.intToDateTime(widget.eliminacao.createAt)),
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 260,
                      child: Text(
                        widget.eliminacao.description != null
                            ? widget.eliminacao.description.toString()
                            : "Descrição não informada",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
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
