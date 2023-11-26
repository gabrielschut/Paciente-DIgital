import 'package:flutter/material.dart';
import 'package:paciente_digital/model/afericoes/reclamacoes.dart';
import 'package:paciente_digital/widgets/cards/reclamaaco_card.dart';
import 'package:paciente_digital/db/reclamacoes_repository.dart';
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

ReclamacoesRepository reclamacoesRepository = ReclamacoesRepository();

class _ListReclaacoesScreenState extends State<ListReclaacoesScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController reclamacaoController = TextEditingController();

  FocusNode dateFocusNode = FocusNode();
  FocusNode reclamacaoFocusNode = FocusNode();
  List<Reclamacoes> reclamacoesList = [];

  cleanControllers(){
    dateController.clear();
    reclamacaoController.clear();
  }

  @override
  void initState(){
    super.initState();
    _callDb();
  }

  Future<void> _callDb() async {
    List<Reclamacoes> list = await reclamacoesRepository.listAll();
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
              title: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Novo registro - reclamação',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 252,
                      child: DatePickerField(
                        hint: "01/01/2000",
                        dateFieldName: "Registrada em  ",
                        suffix: "",
                        controller: dateController, focusNode: dateFocusNode,
                      ),
                    ),
                    SizedBox(
                      width: 252,
                      child: MultilineField(controller: reclamacaoController,focusNode: reclamacaoFocusNode),
                    ),
                    Row(
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
