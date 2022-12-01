import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paciente_digital/controller/paciente_controller.dart';
import 'package:paciente_digital/screens/paciente/new_paciente_form_screen.dart';

import '../../widgets/cards/paciente_card.dart';

class PacienteSelect extends GetView<PacienteController> {
  @override
  final controller = Get.put(PacienteController());

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
      body: Obx(() {
        if (controller.loading.value == true) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.pacienteList.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: CardPacienteWidget(
                  paciente: controller.pacienteList[index],
                ),
              );
            },
            itemCount: controller.pacienteList.length,
          );
        } else {
          return Center(
            child: Text(
              "Nenhum paciente cadastrado",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
              ),
            ),
          );
        }
      }),
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
