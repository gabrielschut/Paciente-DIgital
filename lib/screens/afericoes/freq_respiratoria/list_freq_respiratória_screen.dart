import 'package:flutter/material.dart';
import 'package:paciente_digital/Utils/ProjectUtils.dart';
import 'package:paciente_digital/db/frequenci_respiratoria_repository.dart';
import 'package:paciente_digital/model/afericoes/frequencia_respiratoria.dart';
import 'package:paciente_digital/widgets/cards/card_frequencia_resiratoria.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';

// ignore: must_be_immutable
class ListFrequenciaRespiratoria extends StatefulWidget {
  int pacienteId;

  ListFrequenciaRespiratoria({
    Key? key,
    required this.pacienteId,
  }) : super(key: key);

  @override
  State<ListFrequenciaRespiratoria> createState() =>
      _ListFrequenciaRespiratoriaState();
}

FrequenciaRespiratoriaRepository frequenciaRespiratoriaRepository = FrequenciaRespiratoriaRepository();


class _ListFrequenciaRespiratoriaState extends State<ListFrequenciaRespiratoria> {

  TextEditingController dateController = TextEditingController();
  TextEditingController freqController = TextEditingController();

  FocusNode dateFocusNode = FocusNode();
  FocusNode freqFocusNode = FocusNode();
  List<FrequenciaRespiratoria> frequencias = [];

  @override
  void initState(){
    super.initState();
    _callDb();
  }

  Future<void> _callDb() async {
    List<FrequenciaRespiratoria> list = await frequenciaRespiratoriaRepository.listAll();
    setState(() {
      frequencias = list;
    });
  }

  cleanControllers(){
    dateController.clear();
    freqController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 0),
          child: Text(
            "Frequências respiratórias",
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
            child: frequencias.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: CardFrequenciaRespiratoria(
                          frequenciaRespiratoria: frequencias[index],
                        ),
                      );
                    },
                    itemCount: frequencias.length,
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
              title: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Novo registro',
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
                        dateFieldName: "Tirado em ",
                        suffix: "",
                        controller: dateController,
                        focusNode: dateFocusNode,
                      ),
                    ),
                    SizedBox(
                      width: 252,
                      child: NumberField(
                        hint: "80",
                        fieldName: "Respirações / min",
                        suffix: "mrm",
                        controller: freqController,
                        focusNode: freqFocusNode,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
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
                                frequenciaRespiratoriaRepository.create(widget.pacienteId,
                                    ProjectUtils.convertUsinEphoch(dateController.text),
                                double.parse(freqController.text)
                                );
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
