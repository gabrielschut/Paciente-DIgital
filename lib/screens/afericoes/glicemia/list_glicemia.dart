import 'package:flutter/material.dart';
import 'package:paciente_digital/model/afericoes/glicemia.dart';
import 'package:paciente_digital/screens/afericoes/glicemia/new_glicemia_screen.dart';
import 'package:paciente_digital/widgets/cards/glicemi_card.dart';

class ListGlicemia extends StatefulWidget {

  const ListGlicemia({
    Key? key,
  }) : super(key: key);

  @override
  State<ListGlicemia> createState() => _ListGlicemiaState();
}

void removeDupliciti(List<Glicemia> glicemias) {
  glicemias = glicemias.toSet().toList();
}

class _ListGlicemiaState extends State<ListGlicemia> {
  @override
  Widget build(BuildContext context) {
    Glicemia glicemia = Glicemia(idPaciente: 1, createA: DateTime(2022,10,25), value: 100);
    Glicemia glicemia1 = Glicemia(idPaciente: 1, createA: DateTime(2022,10,26), value: 115);
    Glicemia glicemia2 = Glicemia(idPaciente: 1, createA: DateTime(2022,10,27), value: 150);
    List<Glicemia> glicemias = [];
    glicemias.addAll([glicemia, glicemia1, glicemia2]);
    
    removeDupliciti(glicemias);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Glicemias",
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
            child: glicemias.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: GlicemiaCard(
                          glicemia: glicemias[index],
                        ),
                      );
                    },
                    itemCount: glicemias.length,
                  )
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                      child: Text(
                        "Nenhuma aferição de frequencia cardiaca foi registrada",
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
              MaterialPageRoute(builder: (context) => NewGlicemia())
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
