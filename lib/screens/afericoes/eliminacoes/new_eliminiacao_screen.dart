import 'package:flutter/material.dart';
import 'package:paciente_digital/widgets/components/dropdown_field.dart';
import 'package:paciente_digital/widgets/components/multilene_field.dart';

class NewEliminacao extends StatefulWidget {
  const NewEliminacao({Key? key}) : super(key: key);

  @override
  State<NewEliminacao> createState() => _NewEliminacaoState();
}

class _NewEliminacaoState extends State<NewEliminacao> {
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
            padding: EdgeInsets.fromLTRB(8, 32, 8, 8),
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
            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
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
