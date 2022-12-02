import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/model/paciente.dart';

class TabPacienteEntitie {
  final Paciente paciente;
  final List<Medicamento> medicamentos;

  TabPacienteEntitie({
    required this.paciente,
    required this.medicamentos
});

}