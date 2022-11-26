import 'package:flutter/material.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/screens/tabBar_paciente_controll_screen.dart';

class CardPacienteWidget extends StatefulWidget {
  final Paciente paciente;

  CardPacienteWidget({
    Key? key,
    required this.paciente,
  }) : super(key: key);

  @override
  State<CardPacienteWidget> createState() => _CardPacienteWidgetState();
}

class _CardPacienteWidgetState extends State<CardPacienteWidget> {
  Color setCardColor(Paciente paciente){
    if(paciente.cardiaco && paciente.diabetis){
      return Colors.red.shade100;
    }
    if(paciente.cardiaco){
      return Colors.orange.shade100;
    }
    if(paciente.diabetis){
      return Colors.blue.shade100;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Colors.lightBlue,
        onDoubleTap: () {
          Paciente paciente = Paciente(
            nome: "Gabriel Schutt",
            sexo: "Masculino",
            diabetis: false,
            cardiaco: false,
            idade: 26,
            peso: 60,
            circunferenciaAbdominal: 76.5,
            isActive: true,
            id: 1,
            tipoSanguineo: "O+",
          );
          Medicamento medicamento = Medicamento(
              idPaciente: 1,
              nome: "BuscoPan",
              dosagem: 300,
              tarja: "Amarela",
              dataInicial: DateTime(2022, 11, 25),
              dataTermino: DateTime(2022, 11, 26));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TabBarPacienteControll(
                  paciente: paciente, medicines: [medicamento])));
        },
        child: Container(
          width: 400,
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: setCardColor(widget.paciente),
            shape: BoxShape.rectangle,
            border: Border(
              top: BorderSide(
                width: 1,
                color: Colors.lightBlue,
              ),
              right: BorderSide(
                width: 1,
                color: Colors.lightBlue,
              ),
              left: BorderSide(
                width: 1,
                color: Colors.lightBlue,
              ),
              bottom: BorderSide(
                width: 1,
                color: Colors.lightBlue,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 4, 4, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        widget.paciente.nome,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 26,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.close_sharp,
                            color: Colors.redAccent,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Sexo : " + widget.paciente.sexo,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 30,),
                      Text(
                        "Idade : " + widget.paciente.idade.toString(),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.paciente.diabetis ? "Diabético" : " ",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: widget.paciente.diabetis? 20: 0),
                      Text(
                        widget.paciente.cardiaco? "Cardiáco" : " ",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
