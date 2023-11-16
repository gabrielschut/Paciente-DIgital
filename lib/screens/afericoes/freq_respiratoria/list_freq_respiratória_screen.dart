import 'package:flutter/material.dart';
import 'package:paciente_digital/model/afericoes/frequencia_respiratoria.dart';
import 'package:paciente_digital/widgets/cards/card_frequencia_resiratoria.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/db/frequenci_respiratoria_database_helper.dart';

// ignore: must_be_immutable
class ListFrequenciaRespiratoria extends StatefulWidget {
  List<FrequenciaRespiratoria> frequencias;
  int pacienteId;

  ListFrequenciaRespiratoria({
    Key? key,
    required this.frequencias,
    required this.pacienteId,
  }) : super(key: key);

  @override
  State<ListFrequenciaRespiratoria> createState() =>
      _ListFrequenciaRespiratoriaState();
}

class _ListFrequenciaRespiratoriaState extends State<ListFrequenciaRespiratoria> {

  TextEditingController dateController = TextEditingController();
  TextEditingController frequenciaController = TextEditingController();

  FocusNode dateFocusNode = FocusNode();
  FocusNode frequenciaFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Frequências respiratórias",
            style: TextStyle(
              color: Colors.white,
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
            child: widget.frequencias.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: CardFrequenciaRespiratoria(
                          frequenciaRespiratoria: widget.frequencias[index],
                        ),
                      );
                    },
                    itemCount: widget.frequencias.length,
                  )
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                      child: Text(
                        "Nenhuma aferição de frequência respiratória foi registrada",
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
              title: const Text(
                'Novo medicamento',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: DatePickerField(
                      hint: "01/01/2000",
                      dateFieldName: "Tirado em ",
                      suffix: "",
                      controller: dateController,
                      focusNode: dateFocusNode,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(24, 0, 16, 24),
                        child: Text(
                          'Frequência',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 24, 0),
                        child: SizedBox(
                          width: 230,
                          child: NumberField(
                            hint: "80",
                            fieldName: "Respirações / min",
                            suffix: "mrm",
                            controller: frequenciaController,
                            focusNode: frequenciaFocusNode,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.cancel,
                                  color: Colors.red, size: 15),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                FrequenciaRespiratoriaDatabaseHelper.create(
                                    widget.pacienteId, dateController.text as DateTime, frequenciaController.text as double);
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.check_circle,
                                color: Colors.lightGreen,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
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
