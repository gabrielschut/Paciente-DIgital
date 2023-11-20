import 'package:flutter/material.dart';
import 'package:paciente_digital/db/medicamento_database_helper.dart';
import 'package:paciente_digital/db/paciente_database_helper.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/model/tab_paciente_entitie.dart';
import 'package:paciente_digital/screens/afericoes/select_afericao_type_screen.dart';
import 'package:paciente_digital/screens/medicine/medicines_list_screen.dart';
import 'package:paciente_digital/screens/paciente/paciente_info_screen.dart';

class TabBarPacienteControll extends StatefulWidget {
  const TabBarPacienteControll({super.key,});

  @override
  State<TabBarPacienteControll> createState() => _TabBarPacienteControllState();
}

class _TabBarPacienteControllState extends State<TabBarPacienteControll>{

  late TabPacienteEntitie entitie;

  @override
  void initState(){
    super.initState();
    _callDb();
  }

  Future<void> _callDb() async {
    MedicamentoDatabaseHelper medicamentoDb = MedicamentoDatabaseHelper();
    List<Medicamento> list = await medicamentoDb.listAll();
    entitie = TabPacienteEntitie(paciente: await PacienteDatabaseHelper.getPaciente(), medicamentos: list);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(entitie.paciente.nome,
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
            PacienteInfo(paciente: entitie.paciente),
            MedicinesListScreen(entitie: entitie),
            SelectAfericaoType(pacienteId: entitie.paciente.id),
          ],
        ),
      ),
    );
  }
}