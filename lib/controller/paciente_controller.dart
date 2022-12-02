import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/model/tab_paciente_entitie.dart';
import 'package:paciente_digital/provider/paciente_provider.dart';
import 'package:paciente_digital/screens/paciente/new_paciente_form_screen.dart';

class PacienteController extends GetxController {
  final PacienteProvider pacienteProvider = PacienteProvider();

  List<Paciente> pacienteList = <Paciente>[].obs;
  RxBool loading = false.obs;
  String message = "";
  TabPacienteEntitie? entitie;
  final idPaciente = 0;

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController wightController = TextEditingController();
  TextEditingController circAbdominalCOntroller = TextEditingController();
  TextEditingController heightController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode sexFocusNode = FocusNode();
  FocusNode ageFocusNode = FocusNode();
  FocusNode bloodTypeFocusNode = FocusNode();
  FocusNode wightFocusNode = FocusNode();
  FocusNode circAbdominalFocusNode = FocusNode();
  FocusNode heightFocusNode = FocusNode();

  @override
  void onReady() async {
    super.onReady();
    getAll();
  }

  @override
  getAll() {
    loading(true);
    pacienteProvider.getAll().then((data) {
      pacienteList = data;
    }, onError: (e) {
      message = "Erro ao acessar o servço";
    });
    loading(false);
  }

  getTabPacienteEntite(int id){
    loading(true);
    pacienteProvider.generateTabEntite(id).then((value) {
      entitie = value;
      loading(false);
    });
  }

  addPaciente() {
    formKey.currentState?.reset();
    nameController.text = "";
    sexController.text = "";
    ageController.text = "";
    bloodTypeController.text = "";
    wightController.text = "";
    circAbdominalCOntroller.text = "";
    heightController.text = "";
    Get.to(() => NewPacienteForm());
  }

  editPaciente(Paciente paciente) {
    formKey.currentState?.reset();
    nameController.text = paciente.nome;
    sexController.text = paciente.sexo;
    ageController.text = paciente.idade.toString();
    bloodTypeController.text = paciente.tipoSanguineo!;
    wightController.text = paciente.peso.toString();
    circAbdominalCOntroller.text = paciente.circunferenciaAbdominal.toString();
    heightController.text = paciente.altura.toString();
  }

  savePaciente() async {
    final Paciente newPaciente = Paciente(
      id: 0,
      nome: nameController.text.trim(),
      sexo: sexController.text.trim().isNotEmpty
          ? sexController.text
          : "Indefinido",
      idade: int.parse(ageController.text.trim()),
      peso: double.tryParse(wightController.text.trim()),
      altura: double.tryParse(heightController.text.trim()),
      tipoSanguineo: bloodTypeController.text.trim().isNotEmpty
          ? bloodTypeController.text
          : "Indefinido",
      circunferenciaAbdominal:
          double.tryParse(circAbdominalCOntroller.text.trim()),
    );
    pacienteProvider.save(newPaciente).then((value) {
      loading(false);
      refreshPacienteList();
    });
  }

  updatePaciente() async {
    final Paciente newPaciente = Paciente(
      id: Get.arguments,
      nome: nameController.text,
      sexo: sexController.text,
      idade: int.parse(ageController.text.trim()),
      peso: double.tryParse(wightController.text.trim()),
      altura: double.tryParse(heightController.text.trim()),
      tipoSanguineo: bloodTypeController.text.trim(),
      circunferenciaAbdominal:
          double.tryParse(circAbdominalCOntroller.text.trim()),
    );
    pacienteProvider.update(newPaciente).then((value) {
      loading(false);
      refreshPacienteList();
    });
  }

  deletePaciente(int id) async {
    loading(true);
    pacienteProvider.delete(id).then((value) {
      loading(false);
      refreshPacienteList();
    });
  }

  refreshPacienteList() async {
    await getAll();
    Get.put(PacienteController());
  }
}
