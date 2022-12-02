import 'package:flutter/material.dart';
import 'package:paciente_digital/widgets/components/date_picker_field.dart';
import 'package:paciente_digital/widgets/components/multilene_field.dart';
import 'package:paciente_digital/widgets/components/text_field.dart';

class NewEliminacao extends StatefulWidget {
  const NewEliminacao({Key? key}) : super(key: key);

  @override
  State<NewEliminacao> createState() => _NewEliminacaoState();
}

class _NewEliminacaoState extends State<NewEliminacao> {
  TextEditingController eliminacaoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  FocusNode eliminacaoFocus = FocusNode();
  FocusNode descricaoFocus = FocusNode();
  FocusNode dateFocus = FocusNode();

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
                  child: MyTextField(
                    hint: 'Urina',
                    fieldName: 'Eliminação',
                    suffix: 'abc',
                    controller: eliminacaoController,
                    focusNode: eliminacaoFocus,
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
              controller: dateController, focusNode: dateFocus,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: MultilineField(
              controller: descricaoController, focusNode: descricaoFocus,
            ),
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
