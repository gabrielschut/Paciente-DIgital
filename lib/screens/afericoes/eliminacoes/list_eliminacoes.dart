// ignore_for_file: must_be_immutable

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:paciente_digital/model/afericoes/eliminacoes.dart';
import 'package:paciente_digital/widgets/cards/eliminacao_card.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/multilene_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';
import 'package:paciente_digital/db/eliminacoes_repository.dart';

class ListEliminacoes extends StatefulWidget {
  int pacienteId;

  ListEliminacoes(
      {Key? key,required this.pacienteId})
      : super(key: key);

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

  List<Eliminacoes> listEsliminacoes = [];

  @override
  void initState(){
    super.initState();
    _callDb();
  }

  Future<void> _callDb() async {
    EliminacoesDatabaseHelper db = EliminacoesDatabaseHelper();
    List<Eliminacoes> list = await db.listAll();
    setState(() {
      listEsliminacoes = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
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
              title: const Text(
                'Novo medicamento',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                          child: Text(
                            'Tipo',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
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
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
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
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.cancel,
                              color: Colors.red, size: 15),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            EliminacoesDatabaseHelper.create(
                                widget.pacienteId,
                                eliminacaoController.text,
                                descricaoController.text,
                                dateController.text as DateTime?);
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.check_circle,
                            color: Colors.lightGreen,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
