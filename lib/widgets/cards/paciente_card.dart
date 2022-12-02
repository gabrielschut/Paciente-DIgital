import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paciente_digital/controller/paciente_controller.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/model/tab_paciente_entitie.dart';
import 'package:paciente_digital/screens/paciente/edit_paciente_form_screen.dart';
import 'package:paciente_digital/screens/tabBar_paciente_controll_screen.dart';

class CardPacienteWidget extends GetView<PacienteController> {
  @override
  final controller = Get.find<PacienteController>();
  final Paciente paciente;

  CardPacienteWidget({
    Key? key,
    required this.paciente,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Medicamento medicamento1 = Medicamento(
      idPaciente: 1,
      nome: "CimeGripe",
      dosagem: 30,
      tarja: "Amarela",
      dataInicial: DateTime(2022, 12, 1),
      dataTermino: DateTime(2022, 12, 3),
    );
    TabPacienteEntitie entitie =
        TabPacienteEntitie(paciente: paciente, medicamentos: [medicamento1]);

    return Material(
      child: InkWell(
        splashColor: Colors.lightBlue,
        onDoubleTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => TabBarPacienteControll(entitie: entitie)));
        },
        child: Container(
          width: 400,
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            shape: BoxShape.rectangle,
            border: Border(
              top: BorderSide(
                width: 1,
                color: Colors.lightBlue,
              ),
              right: BorderSide(
                width: 1,
                color: Colors.lightBlue,
              ),
              left: BorderSide(
                width: 1,
                color: Colors.lightBlue,
              ),
              bottom: BorderSide(
                width: 1,
                color: Colors.lightBlue,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 4, 4, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        paciente.nome,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    EditPacienteForm(paciente: paciente)));
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.lightBlueAccent,
                            size: 26,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.deletePaciente(paciente.id!.toInt());
                          },
                          icon: Icon(
                            Icons.close_sharp,
                            color: Colors.redAccent,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Sexo : ${paciente.sexo}",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Idade : ${paciente.idade}",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
