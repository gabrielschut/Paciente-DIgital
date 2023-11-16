import 'package:flutter/material.dart';
import 'package:paciente_digital/model/afericoes/reclamacoes.dart';
import 'package:paciente_digital/widgets/cards/reclamaaco_card.dart';
import 'package:paciente_digital/db/reclamacoes_database_helper.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/multilene_field.dart';

// ignore: must_be_immutable
class ListReclaacoesScreen extends StatefulWidget {
  int pacienteId;

  ListReclaacoesScreen({
    Key? key,
    required this.pacienteId
  }) : super(key: key);

  @override
  State<ListReclaacoesScreen> createState() => _ListReclaacoesScreenState();
}

void removeDupliciti(List<Reclamacoes> reclamacoes) {
  reclamacoes = reclamacoes.toSet().toList();
}

class _ListReclaacoesScreenState extends State<ListReclaacoesScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController reclamacaoController = TextEditingController();

  FocusNode dateFocusNode = FocusNode();
  FocusNode reclamacaoFocusNode = FocusNode();
  List<Reclamacoes> reclamacoesList = [];

  @override
  void initState(){
    super.initState();
    _callDb();
  }

  Future<void> _callDb() async {
    ReclamacoesDatabaseHelper db = ReclamacoesDatabaseHelper();
    List<Reclamacoes> list = await db.listAll();
    setState(() {
      reclamacoesList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Reclamações",
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
            child: reclamacoesList.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: ReclamacoesCard(
                          reclamacao: reclamacoesList[index],
                        ),
                      );
                    },
                    itemCount: reclamacoesList.length,
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
                    padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                    child: DatePickerField(
                      hint: "01/01/2000",
                      dateFieldName: "Registrada em  ",
                      suffix: "",
                      controller: dateController, focusNode: dateFocusNode,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: MultilineField(controller: reclamacaoController,focusNode: reclamacaoFocusNode),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

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
                                ReclamacoesDatabaseHelper.create(widget.pacienteId,
                                    dateController.text as DateTime, reclamacaoController.text);
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
