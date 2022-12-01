import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/provider/medicamento_provider.dart';
import 'package:paciente_digital/screens/medicine/new_medicine_screen.dart';

class MedicamentoController extends GetxController {
  final MedicamentoProvider medicamentoProvider = MedicamentoProvider();

  List<Medicamento> medicineList = <Medicamento>[].obs;
  RxBool loading = false.obs;
  String? message = "";

  final int idPaciente;

  MedicamentoController({
    Key? key,
    required this.idPaciente,
  });

  final formKey = GlobalKey<FormState>();
  TextEditingController idPacienteController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController dosagemController = TextEditingController();
  TextEditingController tarjaController = TextEditingController();
  TextEditingController dataInicialController = TextEditingController();
  TextEditingController dataTerminoController = TextEditingController();

  FocusNode idPacienteFocusNode = FocusNode();
  FocusNode nomeFocusNode = FocusNode();
  FocusNode dosagemFocusNode = FocusNode();
  FocusNode tarjaFocusNode = FocusNode();
  FocusNode dataInicialFocusNode = FocusNode();
  FocusNode dataTerminoFocusNode = FocusNode();

  @override
  void onReady() async {
    super.onReady();
    getAll(idPaciente);
  }

  @override
  getAll(int idPaciente) {
    loading(true);
    medicamentoProvider.getAll(idPaciente).then((data) {
      medicineList = data;
    }, onError: (e) {
      message = "Erro ao acessar o servço";
    });
    loading(false);
  }

  addMedicamento() {
    formKey.currentState?.reset();
    nomeController.text = "";
    idPacienteController.text = "";
    dosagemController.text = "";
    tarjaController.text = "";
    dataInicialController.text = "";
    dataTerminoController.text = "";
    Get.to(() => NewMedicine(idPaciente: idPaciente));
  }

  savePaciente() async {
    final Medicamento newMedicamento = Medicamento(
      idPaciente: idPaciente,
      nome: nomeController.text,
      dosagem: double.parse(dosagemController.text),
      tarja: tarjaController.text,
      dataInicial: DateTime.parse(dataInicialController.text),
      dataTermino: DateTime.parse(dataTerminoController.text),
    );
    medicamentoProvider.save(newMedicamento).then((value) {
      loading(false);
      refreshMedicamentoList();
    });
  }

  deleteMedicine(int id) async {
    loading(true);
    medicamentoProvider.delete(id).then((value) {
      loading(false);
      refreshMedicamentoList();
    });
  }

  refreshMedicamentoList() async {
    await getAll(idPaciente);
    Get.put(MedicamentoController(idPaciente: idPaciente));
  }
}
