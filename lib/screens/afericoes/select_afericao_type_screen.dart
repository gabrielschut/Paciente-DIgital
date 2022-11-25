import 'package:flutter/material.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/widgets/cards/medicine_card.dart';

class SelectAfericaoType extends StatefulWidget {
  final Paciente paciente;

  const SelectAfericaoType({
    Key? key,
    required this.paciente,
  }) : super(key: key);

  @override
  State<SelectAfericaoType> createState() => _SelectAfericaoTypeState();
}

class _SelectAfericaoTypeState extends State<SelectAfericaoType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "${widget.paciente.nome} ${widget.paciente.sobrenome}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 8, 8),
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            shape: BoxShape.rectangle,
            border: Border(
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
          height: 580,
          width: 380,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 36, 0, 10),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.blueAccent,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Eliminações",
                        style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 10),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.blueAccent,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Freq. Cardíaca",
                        style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 10),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.blueAccent,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Frequência Respiratória",
                        style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 10),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.blueAccent,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Glicemia",
                        style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 10),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.blueAccent,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Pressão Arterial",
                        style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 10),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.blueAccent,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Reclamações",
                        style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
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
