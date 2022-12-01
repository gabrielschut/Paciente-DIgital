import 'package:get/get.dart';
import 'package:paciente_digital/db/database_service.dart';
import 'package:paciente_digital/model/medicamento.dart';

class MedicamentoProvider {
  final DataBaseService db = Get.find<DataBaseService>();

  Future<List<Medicamento>> getAll(int idPaciente) async {
    return await db.getAllMedicamento(idPaciente);
  }

  Future<Medicamento> save(Medicamento medicamento) async {
    return await db.saveMedicamento(medicamento);
  }

  Future<int> delete(int id) async{
    return await db.deletePaciente(id);
  }
}