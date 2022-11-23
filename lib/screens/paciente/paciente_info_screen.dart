import 'package:flutter/material.dart';
import 'package:paciente_digital/model/paciente.dart';

class PacienteInfo extends StatefulWidget {
  final Paciente paciente;

  const PacienteInfo({
    Key? key,
    required this.paciente,
  }) : super(key: key);

  @override
  State<PacienteInfo> createState() => _PacienteInfoState();
}

class _PacienteInfoState extends State<PacienteInfo> {
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
          height: 550,
          width: 380,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                        width: 1,
                        color: Colors.black87,
                      ),
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Sexo",
                          style: TextStyle(fontSize: 22, color: Colors.black87),
                        ),
                        Text(
                          widget.paciente.sexo,
                          style: TextStyle(fontSize: 22, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Idade",
                      style: TextStyle(fontSize: 22, color: Colors.black87),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 32),
                      child: Text(
                        widget.paciente.idade.toString(),
                        style: TextStyle(fontSize: 22, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tipo Sanguíneo",
                      style: TextStyle(fontSize: 22, color: Colors.black87),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 28),
                      child: Text(
                        widget.paciente.tipoSanguineo != null
                            ? widget.paciente.tipoSanguineo.toString()
                            : "???",
                        style: TextStyle(fontSize: 22, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Peso",
                      style: TextStyle(fontSize: 22, color: Colors.black87),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 28),
                      child: Text(
                        widget.paciente.peso != null
                            ? widget.paciente.peso.toString()
                            : "???",
                        style: TextStyle(fontSize: 22, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Diabetico?",
                      style: TextStyle(fontSize: 22, color: Colors.black87),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        widget.paciente.diabetis ? "Sim" : "Não",
                        style: TextStyle(fontSize: 22, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Cardíaco?",
                      style: TextStyle(fontSize: 22, color: Colors.black87),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        widget.paciente.cardiaco ? "Sim" : "Não",
                        style: TextStyle(fontSize: 22, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Circ. Abdominal",
                      style: TextStyle(fontSize: 22, color: Colors.black87),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text(
                        widget.paciente.circunferenciaAbdominal != null
                            ? widget.paciente.circunferenciaAbdominal.toString()
                            : "???",
                        style: TextStyle(fontSize: 22, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
