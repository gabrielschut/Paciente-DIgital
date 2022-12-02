import 'package:flutter/material.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/multilene_field.dart';

class NewReclamacao extends StatefulWidget {
  const NewReclamacao({Key? key}) : super(key: key);

  @override
  State<NewReclamacao> createState() => _NewReclamacaoState();
}

class _NewReclamacaoState extends State<NewReclamacao> {
  TextEditingController dateController = TextEditingController();
  TextEditingController reclamacaoController = TextEditingController();

  FocusNode dateFocusNode = FocusNode();
  FocusNode reclamacoesFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Registro de Reclamação",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
            child: DatePickerField(
              hint: "01/01/2000",
              dateFieldName: "Feita em  ",
              suffix: "",
              controller: dateController, focusNode: dateFocusNode,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: MultilineField(controller: reclamacaoController,focusNode: reclamacoesFocusNode),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //chamar o save eliminação
          Navigator.of(context).pop();
        },
        child: Icon(Icons.check,color: Colors.white,),
      ),
    );
  }
}
