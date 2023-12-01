// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:paciente_digital/Utils/ProjectUtils.dart';
import 'package:paciente_digital/model/afericoes/glicemia.dart';
import 'package:paciente_digital/widgets/cards/glicemi_card.dart';
import 'package:paciente_digital/db/glicemia_repository.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';

class ListGlicemia extends StatefulWidget {
  int pacienteId;

  ListGlicemia({Key? key, required this.pacienteId}) : super(key: key);

  @override
  State<ListGlicemia> createState() => _ListGlicemiaState();
}

class _ListGlicemiaState extends State<ListGlicemia> {
  TextEditingController dateController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  FocusNode dateFocusNode = FocusNode();
  FocusNode valueFocusNode = FocusNode();
  List<Glicemia> glicemiaList = [];

  cleanControllers(){
    dateController.clear();
    valueController.clear();
  }

  @override
  void initState() {
    super.initState();
    _callDb();
  }

  GlicemiaRepository glicemiaRepository = GlicemiaRepository();

  Future<void> _callDb() async {
    List<Glicemia> list = await glicemiaRepository.listAll();
    setState(() {
      glicemiaList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text(
            "Glicemias",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            shape: BoxShape.rectangle,
            border: const Border(
              top: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
              right: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
              left: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
              bottom: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
            ),
          ),
          height: 550,
          width: 800,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: glicemiaList.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: GlicemiaCard(
                          glicemia: glicemiaList[index],
                        ),
                      );
                    },
                    itemCount: glicemiaList.length,
                  )
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                      child: Text(
                        "Nenhuma aferição de frequencia cardiaca foi registrada",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Novo registro de glicemia',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 252,
                      child: DatePickerField(
                        hint: ProjectUtils.dateTimeToString(DateTime.now()).replaceAll('-', '/'),
                        dateFieldName: "Data da medição ",
                        suffix: "",
                        controller: dateController,
                        focusNode: dateFocusNode,
                      ),
                    ),
                    SizedBox(
                      width: 252,
                      child: NumberField(
                        hint: "100",
                        fieldName: "Valor",
                        suffix: "ml/dl",
                        controller: valueController,
                        focusNode: valueFocusNode,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 42,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .resolveWith<Color?>((states) {
                                return Colors.redAccent.shade200;
                              }),
                            ),
                            onPressed: () {
                              cleanControllers();
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancelar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 120,
                          height: 42,
                          child:  ElevatedButton(
                            onPressed: () {
                              glicemiaRepository.create(widget.pacienteId,
                                  ProjectUtils.convertUsinEphoch(dateController.text),
                                  double.parse(valueController.text));
                              cleanControllers();
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                      (states) {
                                    return Colors.green.shade300;
                                  }),
                            ),
                            child: const Text(
                              "Salvar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
