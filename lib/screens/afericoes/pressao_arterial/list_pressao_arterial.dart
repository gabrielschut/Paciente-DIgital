import 'package:flutter/material.dart';
import 'package:paciente_digital/model/afericoes/pressao_arterial.dart';
import 'package:paciente_digital/screens/afericoes/pressao_arterial/new_pressao_arterial_screen.dart';
import 'package:paciente_digital/widgets/cards/pressao_aterial_card.dart';

class ListPressaoArterial extends StatefulWidget {
  List<PressaoArterial> pressoes;

  ListPressaoArterial({
    Key? key,
    required this.pressoes,
  }) : super(key: key);

  @override
  State<ListPressaoArterial> createState() => _ListPressaoArterialState();
}

void removeDupliciti(List<PressaoArterial> pressoes) {
  pressoes = pressoes.toSet().toList();
}

class _ListPressaoArterialState extends State<ListPressaoArterial> {
  @override
  Widget build(BuildContext context) {
    removeDupliciti(widget.pressoes);

    PressaoArterial pressaoArterial = PressaoArterial(
      idPaciente: 1,
      createAt: DateTime(2022, 10, 25),
      maxima: 12,
      minima: 8,
    );

    PressaoArterial pressaoArterial1 = PressaoArterial(
      idPaciente: 1,
      createAt: DateTime(2022, 10, 28),
      maxima: 12,
      minima: 8,
    );

    PressaoArterial pressaoArterial2 = PressaoArterial(
      idPaciente: 1,
      createAt: DateTime(2022, 11, 5),
      maxima: 13,
      minima: 10,
    );

    PressaoArterial pressaoArterial3 = PressaoArterial(
      idPaciente: 1,
      createAt: DateTime(2022, 11, 8),
      maxima: 10,
      minima: 6,
    );

    widget.pressoes.addAll([
      pressaoArterial,
      pressaoArterial1,
      pressaoArterial2,
      pressaoArterial3
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Pressões arteriais",
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
            child: widget.pressoes.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: PressaoArterialCard(
                          pressaoArterial: widget.pressoes[index],
                        ),
                      );
                    },
                    itemCount: widget.pressoes.length,
                  )
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                      child: Text(
                        "Nenhuma aferição de nível de glicemia foi registrada",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //nova eliminação seja destruida após sair ou finalizar e traga
          // de volta para esta tela. E essa pagina seja carregada do zero.
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NewPressaoArterial()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
