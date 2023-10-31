import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paciente_digital/model/afericoes/eliminacoes.dart';

class EliminacaoCard extends StatefulWidget {
  final Eliminacoes eliminacao;
  final List<Eliminacoes> eliminaceosList;

  const EliminacaoCard({
    Key? key,
    required this.eliminacao,
    required this.eliminaceosList,
  }) : super(key: key);

  @override
  State<EliminacaoCard> createState() => _EliminacaoCardState();
}

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
          padding: const EdgeInsets.fromLTRB(0, 4, 4, 8),
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
                        color: Colors.blueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      widget.eliminaceosList.remove(widget.eliminacao);
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
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text("Data : ${DateFormat("dd/MM/yyyy").format(widget.eliminacao.createAt)}",
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 260,
                      child: Text(
                        widget.eliminacao.description != null
                            ? widget.eliminacao.description.toString()
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
