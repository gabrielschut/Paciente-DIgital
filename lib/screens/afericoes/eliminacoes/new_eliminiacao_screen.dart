import 'package:flutter/material.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/dropdown_field.dart';
import 'package:paciente_digital/widgets/components/multilene_field.dart';

class NewEliminacao extends StatefulWidget {
  const NewEliminacao({Key? key}) : super(key: key);

  @override
  State<NewEliminacao> createState() => _NewEliminacaoState();
}

class _NewEliminacaoState extends State<NewEliminacao> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Registro de Eliminação",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8, 16, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                  child: const Text(
                    'Tipo',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: DropdownField(
                    hint: "Urina",
                    DropOpcoes: ["Urina", "Fezes", "Vomito", "Outro"],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: DatePickerField(
              hint: "01/01/2000",
              dateFieldName: "Data      ",
              suffix: "",
              initialDateController: _dateController,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: MultilineField(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //chamar o save eliminação
        },
        child: Icon(Icons.check,color: Colors.white,),
      ),
    );
  }
}
