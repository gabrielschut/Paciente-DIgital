import 'package:flutter/material.dart';
import 'package:paciente_digital/model/tab_paciente_entitie.dart';
import 'package:paciente_digital/screens/afericoes/select_afericao_type_screen.dart';
import 'package:paciente_digital/screens/medicine/medicines_list_screen.dart';
import 'package:paciente_digital/screens/paciente/paciente_info_screen.dart';

class TabBarPacienteControll extends StatefulWidget {
  TabPacienteEntitie entitie;

  TabBarPacienteControll({
    super.key,
    required this.entitie
  });

  @override
  State<TabBarPacienteControll> createState() => _TabBarPacienteControllState();
}

class _TabBarPacienteControllState extends State<TabBarPacienteControll>{
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.entitie.paciente.nome,
            style: const TextStyle(color: Colors.white),),
          centerTitle: true,
          bottom:
          const TabBar(
            tabs: [
              Tab(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.local_hospital,
                  color: Colors.white,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.edit_note_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PacienteInfo(paciente: widget.entitie.paciente),
            MedicinesListScreen(entitie: widget.entitie),
            SelectAfericaoType(pacienteId: widget.entitie.paciente.id),
          ],
        ),
      ),
    );
  }
}