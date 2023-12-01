import 'package:flutter/material.dart';
import 'package:paciente_digital/Utils/ProjectUtils.dart';
import 'package:paciente_digital/model/afericoes/pressao_arterial.dart';
import 'package:paciente_digital/widgets/cards/pressao_aterial_card.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/db/pressao_repository.dart';

// ignore: must_be_immutable
class ListPressaoArterial extends StatefulWidget {
  int pacienteId;

  ListPressaoArterial({Key? key, required this.pacienteId}) : super(key: key);

  @override
  State<ListPressaoArterial> createState() => _ListPressaoArterialState();
}

PressaoArterialRepository pressaoArterialRepository = PressaoArterialRepository();

class _ListPressaoArterialState extends State<ListPressaoArterial> {
  TextEditingController maxController = TextEditingController();
  TextEditingController minController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  FocusNode maxFocusNode = FocusNode();
  FocusNode minFocusNode = FocusNode();
  FocusNode dateFocusNode = FocusNode();
  List<PressaoArterial> pressoes = [];

  cleanControllers() {
    maxController.clear();
    minController.clear();
  }

  Future<void> _callDb() async {
    List<PressaoArterial> list = await pressaoArterialRepository.listAll();
    setState(() {
      pressoes = list;
    });
  }

  @override
  void initState() {
    super.initState();
    _callDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            "Pressões arteriais",
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
            child: pressoes.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: PressaoArterialCard(
                          pressaoArterial: pressoes[index],
                        ),
                      );
                    },
                    itemCount: pressoes.length,
                  )
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                      child: Text(
                        "Nenhuma aferição de nível de glicemia foi registrada",
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
                  'Novo registro - pressão arterial',
                  style: TextStyle(
                    fontSize: 16,
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
                        hint: "120",
                        fieldName: "Sistólica | Maxima",
                        suffix: "mmHg",
                        controller: maxController,
                        focusNode: maxFocusNode,
                      ),
                    ),
                    SizedBox(
                      width: 252,
                      child: NumberField(
                        hint: "80",
                        fieldName: "Diastólica | Minima",
                        suffix: "mmHg",
                        controller: minController,
                        focusNode: minFocusNode,
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
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (states) {
                                  return Colors.redAccent.shade200;
                                }),
                              ),
                              onPressed: () {
                                pressaoArterialRepository.create(widget.pacienteId,
                                    ProjectUtils.convertUsinEphoch(dateController.text),
                                    int.parse(maxController.text),
                                    int.parse(minController.text));
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
                            child: ElevatedButton(
                              onPressed: () {
                                pressaoArterialRepository.create
                                  (widget.pacienteId,
                                    ProjectUtils.convertUsinEphoch(dateController.text),
                                    int.parse(maxController.text),
                                    int.parse(minController.text));
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
