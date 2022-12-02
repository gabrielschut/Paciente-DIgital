import 'package:get/get.dart';
import 'package:paciente_digital/db/database_service.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/model/tab_paciente_entitie.dart';

class PacienteProvider {
  final DataBaseService db = Get.find<DataBaseService>();

  Future<List<Paciente>> getAll() async {
    return await db.getAllPacientes();
  }

  Future<Paciente> save(Paciente paciente) async {
    return await db.savePaciente(paciente);
  }

  Future<Paciente> update(Paciente paciente) async{
    return await db.updatePaciente(paciente);
  }

  Future<int> delete(int id) async{
    return await db.deletePaciente(id);
  }

  Future<TabPacienteEntitie> generateTabEntite(int id) async {
    return await db.generateTabPaciente(id);
  }
}