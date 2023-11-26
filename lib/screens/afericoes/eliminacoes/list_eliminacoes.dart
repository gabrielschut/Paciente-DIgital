// ignore_for_file: must_be_immutable

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:paciente_digital/Utils/ProjectUtils.dart';
import 'package:paciente_digital/model/afericoes/eliminacoes.dart';
import 'package:paciente_digital/widgets/cards/eliminacao_card.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/multilene_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';
import 'package:paciente_digital/db/eliminacoes_repository.dart';

class ListEliminacoes extends StatefulWidget {
  int pacienteId;

  ListEliminacoes({Key? key, required this.pacienteId}) : super(key: key);

  @override
  State<ListEliminacoes> createState() => _ListEliminacoesState();
}

EliminacoesRepository eliminacoesRepository = EliminacoesRepository();



class _ListEliminacoesState extends State<ListEliminacoes> {
  TextEditingController dateController = TextEditingController();
  TextEditingController eliminacaoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  FocusNode dateFocusNode = FocusNode();
  FocusNode eliminacaoFocusNode = FocusNode();
  FocusNode descricaoFocusNode = FocusNode();

  List<Eliminacoes> listEsliminacoes = [];

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

  Future<void> _callDb() async {
    List<Eliminacoes> list = await eliminacoesRepository.listAll();
    setState(() {
      listEsliminacoes = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text(
            "Eliminações",
            style: TextStyle(
              color: Colors.white,
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
            child: listEsliminacoes.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: EliminacaoCard(
                          eliminacao: listEsliminacoes[index],
                        ),
                      );
                    },
                    itemCount: listEsliminacoes.length,
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
                        hint: "01/01/2000",
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
                              onPressed: () {
                                eliminacoesRepository.create(
                                    widget.pacienteId,
                                    eliminacaoController.text,
                                    descricaoController.text,
                                    ProjectUtils.convertStringToDateTime(dateController.text));
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
