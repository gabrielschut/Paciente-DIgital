import 'package:flutter/material.dart';

class CardPacienteWidget extends StatelessWidget {
  const CardPacienteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Card(
          child: const ListTile(
            title: Text('nome do paciente'),
            subtitle: Text('idade e sexo'),
          ),
          margin: const EdgeInsets.all(16),
          color: Colors.grey.shade100,
        ),
        splashColor: Colors.lightBlue,
        onDoubleTap: () {
        //craiar rota para tela do paciente com os dados
        },
      ),
    );
  }
}
