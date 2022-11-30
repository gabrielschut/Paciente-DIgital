// import 'package:flutter/material.dart';
// import 'package:paciente_digital/model/afericoes/frequencia_cardiaca.dart';
// import 'package:paciente_digital/screens/afericoes/frequencia_cardiaca/new_freq_cardiaca_screen.dart';
// import 'package:paciente_digital/widgets/cards/freq_cardiaca_card.dart';
//
// class ListFrequenciaCardiaca extends StatefulWidget {
//   final List<FrenquenciaCardiaca> frequencias;
//
//   const ListFrequenciaCardiaca({
//     Key? key,
//     required this.frequencias,
//   }) : super(key: key);
//
//   @override
//   State<ListFrequenciaCardiaca> createState() => _ListFrequenciaCardiacaState();
// }
//
// void removeDupliciti(List<FrenquenciaCardiaca> frequencias) {
//   frequencias = frequencias.toSet().toList();
// }
//
// class _ListFrequenciaCardiacaState extends State<ListFrequenciaCardiaca> {
//   @override
//   Widget build(BuildContext context) {
//     removeDupliciti(widget.frequencias);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Frequências cardiácas",
//             style: const TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
//         child: Container(
//           padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
//           alignment: Alignment.topLeft,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(24),
//             shape: BoxShape.rectangle,
//             border: const Border(
//               top: BorderSide(
//                 width: 2,
//                 color: Colors.lightBlue,
//               ),
//               right: BorderSide(
//                 width: 2,
//                 color: Colors.lightBlue,
//               ),
//               left: BorderSide(
//                 width: 2,
//                 color: Colors.lightBlue,
//               ),
//               bottom: BorderSide(
//                 width: 2,
//                 color: Colors.lightBlue,
//               ),
//             ),
//           ),
//           height: 550,
//           width: 800,
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
//             child: widget.frequencias.isNotEmpty
//                 ? ListView.builder(
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: CardFreqCardiaca(
//                           frenquenciaCardiaca: widget.frequencias[index],
//                         ),
//                       );
//                     },
//                     itemCount: widget.frequencias.length,
//                   )
//                 : const Center(
//                     child: Padding(
//                       padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
//                       child: Text(
//                         "Nenhuma aferição de frequência cardíaca foi registrada",
//                         style: TextStyle(
//                           color: Colors.blueAccent,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           //nova eliminação seja destruida após sair ou finalizar e traga
//           // de volta para esta tela. E essa pagina seja carregada do zero.
//           Navigator.of(context).push(
//               MaterialPageRoute(builder: (context) => NewFreqCardiaca())
//           );
//         },
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
