import 'package:flutter/material.dart';
import 'package:paciente_digital/models/pacientes.dart';
import 'package:paciente_digital/utils/database/database_pacientes.dart';


class PacienteProvider with ChangeNotifier {
  Future<void> loadPacientes() async {
    Paciente paciente;
    DataBasePaciente db;
    final dataList = await db.getPaciente(paciente.id);
    notifyListeners();
    return dataList;
    }


}
