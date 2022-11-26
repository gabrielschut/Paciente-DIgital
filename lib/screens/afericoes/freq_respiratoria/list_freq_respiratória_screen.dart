import 'package:flutter/material.dart';
import 'package:paciente_digital/model/afericoes/frequencia_respiratoria.dart';
import 'package:paciente_digital/screens/afericoes/freq_respiratoria/new_freq_respiratoria_screen.dart';
import 'package:paciente_digital/widgets/cards/card_frequencia_resirat%C3%B3ria.dart';

class ListFrequenciaRespiratoria extends StatefulWidget {
  final List<FrequenciaRespiratoria> frequencias;

  const ListFrequenciaRespiratoria({
    Key? key,
    required this.frequencias,
  }) : super(key: key);

  @override
  State<ListFrequenciaRespiratoria> createState() =>
      _ListFrequenciaRespiratoriaState();
}

void removeDupliciti(List<FrequenciaRespiratoria> frequencias) {
  frequencias = frequencias.toSet().toList();
}

class _ListFrequenciaRespiratoriaState
    extends State<ListFrequenciaRespiratoria> {
  @override
  Widget build(BuildContext context) {
    removeDupliciti(widget.frequencias);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Frequências respiratórias",
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
            child: widget.frequencias.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: CardFrequenciaRespiratoria(
                          frequenciaRespiratoria: widget.frequencias[index],
                        ),
                      );
                    },
                    itemCount: widget.frequencias.length,
                  )
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                      child: Text(
                        "Nenhuma aferição de frequência respiratória foi registrada",
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
              MaterialPageRoute(builder: (context) => NewFreqRespiratoria())
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
