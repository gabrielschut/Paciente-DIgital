import 'package:flutter/material.dart';

import '../widgets/cards/paciente_card.dart';

class PacienteSelect extends StatefulWidget {
  const PacienteSelect({Key? key}) : super(key: key);

  @override
  State<PacienteSelect> createState() => _PacienteSelectState();
}

class _PacienteSelectState extends State<PacienteSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PACIENTE DIGITAL'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(
        children: const <Widget>[
          CardPacienteWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //criar navegação para criação de novo usuário
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
