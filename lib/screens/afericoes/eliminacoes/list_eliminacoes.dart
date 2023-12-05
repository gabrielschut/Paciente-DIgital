// ignore_for_file: must_be_immutable

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:paciente_digital/Utils/ProjectUtils.dart';
import 'package:paciente_digital/model/afericoes/eliminacoes.dart';
import 'package:paciente_digital/widgets/cards/eliminacao_card.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/multilene_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';

class ListEliminacoes extends StatefulWidget {
  int pacienteId;
  List<Eliminacoes> listEsliminacoes;
  ListEliminacoes({Key? key, required this.pacienteId, required this.listEsliminacoes}) : super(key: key);

  @override
  State<ListEliminacoes> createState() => _ListEliminacoesState();
}

class _ListEliminacoesState extends State<ListEliminacoes> {
  TextEditingController dateController = TextEditingController();
  TextEditingController eliminacaoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  FocusNode dateFocusNode = FocusNode();
  FocusNode eliminacaoFocusNode = FocusNode();
  FocusNode descricaoFocusNode = FocusNode();

  cleanControllers(){
    eliminacaoController.clear();
    descricaoController.clear();
    dateController.clear();
  }

  @override
  void initState() {
    super.initState();
    _callDb();
  }

  void updateList(Eliminacoes eliminacoes) {
    setState(() {
      widget.listEsliminacoes.add(eliminacoes);
    });
  }

  Future<void> _callDb() async {
    List<Eliminacoes> list = await eliminacoesRepository.listAll();
    setState(() {
      widget.listEsliminacoes = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 64),
          child: Text(
            "Eliminações",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26
            ),
          ),
        ),
      ),
      body: Padding(
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
          height: 550,
          width: 800,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: widget.listEsliminacoes.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: EliminacaoCard(
                          eliminacao: widget.listEsliminacoes[index],
                            onExclude: () {
                              setState(() {
                                widget.listEsliminacoes.removeAt(index);
                              });
                            }
                        ),
                      );
                    },
                    itemCount: widget.listEsliminacoes.length,
                  )
                : const Center(
                    child: Text(
                      "Nenhuma eliminação foi registrada",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                      ),
                    ),
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Novo registro - Eliminação',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 252,
                            child: MyTextField(
                              hint: 'Urina',
                              fieldName: 'Eliminação',
                              suffix: 'abc',
                              controller: eliminacaoController,
                              focusNode: eliminacaoFocusNode,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: DatePickerField(
                        hint: ProjectUtils.dateTimeToString(DateTime.now()).replaceAll('-', '/'),
                        dateFieldName: "Data      ",
                        suffix: "",
                        controller: dateController,
                        focusNode: dateFocusNode,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: MultilineField(
                        controller: descricaoController,
                        focusNode: descricaoFocusNode,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 42,
                            child: ElevatedButton(
                              style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .resolveWith<Color?>((states) {
                                return Colors.redAccent.shade200;
                              }),
                            ),
                              onPressed: () {
                                cleanControllers();
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Cancelar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: 120,
                            height: 42,
                            child:  ElevatedButton(
                              onPressed: () async {
                                int id = await eliminacoesRepository.create(
                                    widget.pacienteId,
                                    eliminacaoController.text,
                                    descricaoController.text,
                                    ProjectUtils.convertUsinEphoch(dateController.text));
                                Eliminacoes eliminacoes = Eliminacoes(id: id,
                                    idPaciente: widget.pacienteId,
                                    createAt: ProjectUtils.convertUsinEphoch(dateController.text),
                                    excrecao: eliminacaoController.text,
                                    description: descricaoController.text);
                                updateList(eliminacoes);
                                cleanControllers();
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                        (states) {
                                      return Colors.green.shade300;
                                    }),
                              ),
                              child: const Text(
                                "Salvar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
