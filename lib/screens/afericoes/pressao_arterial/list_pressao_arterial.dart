import 'package:flutter/material.dart';
import 'package:paciente_digital/model/afericoes/pressao_arterial.dart';
import 'package:paciente_digital/widgets/cards/pressao_aterial_card.dart';
import 'package:paciente_digital/widgets/components/number_field.dart';
import 'package:paciente_digital/db/pressao_arterial_database_helper.dart';

// ignore: must_be_immutable
class ListPressaoArterial extends StatefulWidget {
  int pacienteId;

  ListPressaoArterial(
      {Key? key, required this.pacienteId})
      : super(key: key);

  @override
  State<ListPressaoArterial> createState() => _ListPressaoArterialState();
}

class _ListPressaoArterialState extends State<ListPressaoArterial> {

    TextEditingController maxController = TextEditingController();
    TextEditingController minController = TextEditingController();

    FocusNode maxFocusNode = FocusNode();
    FocusNode minFocusNode = FocusNode();
    List<PressaoArterial> pressoes = [];

    Future<void> _callDb() async {
      PressaoArterialDatabaseHelper db = PressaoArterialDatabaseHelper();
      List<PressaoArterial> list = await db.listAll();
      setState(() {
        pressoes = list;
      });
    }

    @override
    void initState(){
      super.initState();
      _callDb();
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Pressões arteriais",
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
              title: const Text(
                'Novo registro: pressão art.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 24, 0),
                    child: NumberField(
                      hint: "120",
                      fieldName: "Sistólica | Maxima",
                      suffix: "mmHg",
                      controller: maxController,
                      focusNode: maxFocusNode,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 24, 0),
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
                        ElevatedButton(
                          onPressed: () {
                            PressaoArterialDatabaseHelper.create(
                                widget.pacienteId,
                                DateTime.now(),
                                maxController.text as int,
                                minController as int);
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.cancel,
                              color: Colors.red, size: 15),
                        ),
                        ElevatedButton(
                          onPressed: () {
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
