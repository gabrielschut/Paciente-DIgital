import 'package:flutter/material.dart';
import 'package:paciente_digital/Utils/ProjectUtils.dart';
import 'package:paciente_digital/model/afericoes/frequencia_cardiaca.dart';
import 'package:paciente_digital/widgets/cards/freq_cardiaca_card.dart';
import 'package:paciente_digital/db/frequencia_cardiaca_repository.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';

// ignore: must_be_immutable
class ListFrequenciaCardiaca extends StatefulWidget {
  int pacienteId;
  ListFrequenciaCardiaca(
      {Key? key, required this.pacienteId})
      : super(key: key);

  @override
  State<ListFrequenciaCardiaca> createState() => _ListFrequenciaCardiacaState();
}

class _ListFrequenciaCardiacaState extends State<ListFrequenciaCardiaca> {

  TextEditingController dateController = TextEditingController();
  TextEditingController frequenciaController = TextEditingController();

  FocusNode dateFocusNode = FocusNode();
  FocusNode frequenciaFocusNode = FocusNode();
  List<FrenquenciaCardiaca> frequenciasList = [];

  cleanControllers(){
    frequenciaController.clear();
    dateController.clear();
  }

  @override
  void initState(){
    super.initState();
    _callDb();
  }

  FrequenciaCardiacaRepository frequenciaCardiacaRepository = FrequenciaCardiacaRepository();

  Future<void> _callDb() async {
    List<FrenquenciaCardiaca> list = await frequenciaCardiacaRepository.listAll();
    setState(() {
      frequenciasList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 32),
          child: Text(
            "Frequências cardíacas",
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
            child: frequenciasList.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: CardFreqCardiaca(
                          frenquenciaCardiaca: frequenciasList[index],
                        ),
                      );
                    },
                    itemCount: frequenciasList.length,
                  )
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                      child: Text(
                        "Nenhuma aferição de frequência cardíaca foi registrada",
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SizedBox(
                        width: 252,
                        child: DatePickerField(
                          hint: "01/01/2000",
                          dateFieldName: "Data da medição",
                          suffix: "",
                          controller: dateController,
                          focusNode: dateFocusNode,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: SizedBox(
                        width: 252,
                        child: NumberField(
                          hint: "80.5",
                          fieldName: "Batimentos / min",
                          suffix: "/min",
                          controller: frequenciaController,
                          focusNode: frequenciaFocusNode,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
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
                                  frequenciaCardiacaRepository.create(widget.pacienteId,
                                      ProjectUtils.convertStringToDateTime(dateController.text),
                                      double.parse(frequenciaController.text));
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
