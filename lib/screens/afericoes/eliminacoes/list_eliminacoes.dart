import 'package:flutter/material.dart';
import 'package:paciente_digital/model/afericoes/eliminacoes.dart';
import 'package:paciente_digital/screens/afericoes/eliminacoes/new_eliminiacao_screen.dart';
import 'package:paciente_digital/widgets/cards/eliminacao_card.dart';

class ListEliminacoes extends StatefulWidget {

  const ListEliminacoes({
    Key? key,
  }) : super(key: key);

  @override
  State<ListEliminacoes> createState() => _ListEliminacoesState();
}

void removeDupliciti(List<Eliminacoes> elimin) {
  elimin = elimin.toSet().toList();
}

class _ListEliminacoesState extends State<ListEliminacoes> {
  @override
  Widget build(BuildContext context) {

    Eliminacoes eliminacoes = Eliminacoes(idPaciente: 1,
      createAt: DateTime(2022,12,3),
      excrecao: "coco",
      description: "Teste 123",);

    Eliminacoes eliminacoes2 = Eliminacoes(idPaciente: 1,
      createAt: DateTime(2022,12,3),
      excrecao: "Urina",
      description: "Esta verde",);

    Eliminacoes eliminacoes3 = Eliminacoes(idPaciente: 1,
      createAt: DateTime(2022,12,3),
      excrecao: "Cartarro",
      description: "Apresenta pontos vermelhos",);

    List<Eliminacoes> listEsliminacoes = [];
    listEsliminacoes.addAll([eliminacoes, eliminacoes2, eliminacoes3]);

    removeDupliciti(listEsliminacoes);


    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Eliminações",
            style: const TextStyle(
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
                    eliminaceosList: listEsliminacoes,
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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>
                  NewEliminacao(listEliminacoes: listEsliminacoes,))
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
