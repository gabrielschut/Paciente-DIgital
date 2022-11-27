import 'package:flutter/material.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/repository/paciente_repository.dart';
import 'package:paciente_digital/screens/paciente/new_paciente_form_screen.dart';

import '../../widgets/cards/paciente_card.dart';

class PacienteSelect extends StatefulWidget {
  final List<Paciente> pacientes;

  const PacienteSelect({Key? key, required this.pacientes}) : super(key: key);

  @override
  State<PacienteSelect> createState() => _PacienteSelectState();
}

void removeDupliciti(List<Paciente> pacientes) {
  pacientes = pacientes.toSet().toList();
}

class _PacienteSelectState extends State<PacienteSelect> {
  Future<List<Paciente>> _data = PacienteRepository.INSTANCE.getAll();

  @override
  void initState() {
    super.initState();

    _data = PacienteRepository.INSTANCE.getAll();
  }

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
      body: FutureBuilder<List<Paciente>>(
        future: _data,
        builder: (context, snapshot) {
          List<Widget> children;
          if (!snapshot.hasData) {
            children = <Widget>[
              CircularProgressIndicator(color: Colors.lightBlueAccent,),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(Icons.error_outline,
                  color: Colors.redAccent,
                  size: 45),
              Padding(padding: EdgeInsets.only(top: 16),
                child: Text("Error: ${snapshot.error}"),),
            ];
          } else {
            List<Paciente> pacientes = _data as List<Paciente>;
            children = <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
              child: pacientes.length > 0
                  ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                      title: CardPacienteWidget(
                      paciente: pacientes[index],
                    ),
                    onTap: () => removeDupliciti(pacientes),
                  );
                },
                itemCount: pacientes.length,
              )
                  : Container(
                child: Center(
                  child: Text(
                    "Nenhum medicamento cadastrado",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            ];
          }
          return Column(
          children: children,
          );
        },
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
