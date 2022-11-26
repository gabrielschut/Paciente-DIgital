import 'package:flutter/material.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/screens/paciente/new_paciente_form_screen.dart';

import '../../widgets/cards/paciente_card.dart';

class PacienteSelect extends StatefulWidget {
  final List<Paciente> pacientes;

  const PacienteSelect({Key? key, required this.pacientes}) : super(key: key);

  @override
  State<PacienteSelect> createState() => _PacienteSelectState();
}

void removeDupliciti(List<Paciente> pacientes){
  pacientes = pacientes.toSet().toList();
}

class _PacienteSelectState extends State<PacienteSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PACIENTE DIGITAL',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: CardPacienteWidget(
              paciente: widget.pacientes[index],
            ),
            onTap: () => removeDupliciti(widget.pacientes),
          );
        },
        itemCount: widget.pacientes.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NewPacienteForm()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
