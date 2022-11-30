import 'package:flutter/material.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/screens/afericoes/select_afericao_type_screen.dart';
import 'package:paciente_digital/screens/medicine/medicines_list_screen.dart';
import 'package:paciente_digital/screens/paciente/paciente_info_screen.dart';

class TabBarPacienteControll extends StatefulWidget {
  final Paciente paciente;
  final List<Medicamento> medicines;

  const TabBarPacienteControll({
    Key? key,
    required this.paciente,
    required this.medicines,
  }) : super(key: key);

  @override
  State<TabBarPacienteControll> createState() => _TabBarPacienteControllState();
}

class _TabBarPacienteControllState extends State<TabBarPacienteControll> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.paciente.nome,
          style: TextStyle(color: Colors.white),),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              // Tab(
              //   child: Icon(
              //     Icons.local_hospital,
              //     color: Colors.white,
              //   ),
              // ),
              // Tab(
              //   child: Icon(
              //     Icons.edit_note_sharp,
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PacienteInfo(paciente: widget.paciente,),
            // MedicinesListScreen(medicines: widget.medicines,),
            // SelectAfericaoType(paciente: widget.paciente),
          ],
        ),
      ),
    );
  }
}
