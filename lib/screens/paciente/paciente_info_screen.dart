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
    return Padding(
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
        width: 380,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: Colors.blueAccent,
                    ),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sexo",
                        style:
                            TextStyle(fontSize: 22, color: Colors.blueAccent),
                      ),
                      Text(
                        widget.paciente.sexo,
                        style: const TextStyle(
                            fontSize: 22, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: Colors.blueAccent,
                  ),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Idade",
                      style: TextStyle(fontSize: 22, color: Colors.blueAccent),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: Text(
                        widget.paciente.idade.toString(),
                        style: const TextStyle(
                            fontSize: 24, color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: Colors.blueAccent,
                  ),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tipo Sanguíneo",
                      style: TextStyle(fontSize: 22, color: Colors.blueAccent),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 28),
                      child: Text(
                        widget.paciente.tipoSanguineo != null
                            ? widget.paciente.tipoSanguineo.toString()
                            : "???",
                        style: const TextStyle(
                            fontSize: 22, color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: Colors.blueAccent,
                  ),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Peso",
                      style: TextStyle(fontSize: 22, color: Colors.blueAccent),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        widget.paciente.peso != null
                            ? widget.paciente.peso.toString()
                            : "???",
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: Colors.blueAccent,
                  ),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Circ. Abdominal",
                      style: TextStyle(fontSize: 22, color: Colors.blueAccent),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        widget.paciente.circunferenciaAbdominal != null
                            ? widget.paciente.circunferenciaAbdominal.toString()
                            : "???",
                        style: const TextStyle(
                            fontSize: 22, color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 164,
                height: 64,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color?>((states) {
                      return Colors.blueAccent;
                    }),
                  ),
                  onPressed: () async {},
                  child: const Text(
                    "Editar informações",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
