import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paciente_digital/controller/paciente_controller.dart';
import 'package:paciente_digital/model/tab_paciente_entitie.dart';
import 'package:paciente_digital/screens/afericoes/select_afericao_type_screen.dart';
import 'package:paciente_digital/screens/medicine/medicines_list_screen.dart';
import 'package:paciente_digital/screens/paciente/paciente_info_screen.dart';

class TabBarPacienteControll extends GetView<PacienteController> {
  @override
  final controller = Get.put(PacienteController());

  final TabPacienteEntitie entitie;

  TabBarPacienteControll({
    Key? key,
    required this.entitie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(entitie.paciente.nome,
          style: TextStyle(color: Colors.white),),
          centerTitle: true,
          bottom:
          TabBar(
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
            PacienteInfo(paciente: entitie.paciente,),
            MedicinesListScreen(entitie: entitie),
            SelectAfericaoType(paciente: entitie.paciente),
          ],
        ),
      ),
    );
  }
}
