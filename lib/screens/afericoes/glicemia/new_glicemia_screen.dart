// import 'package:flutter/material.dart';
// import 'package:paciente_digital/widgets/components/date_picker_field.dart';
// import 'package:paciente_digital/widgets/components/number_field.dart';
//
// class NewGlicemia extends StatefulWidget {
//   const NewGlicemia({Key? key}) : super(key: key);
//
//   @override
//   State<NewGlicemia> createState() => _NewGlicemiaState();
// }
//
// class _NewGlicemiaState extends State<NewGlicemia> {
//   TextEditingController dateController = TextEditingController();
//   TextEditingController valueController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             "Aferição de Glicemia",
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(0, 16, 0, 32),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 8),
//               child: DatePickerField(
//                 hint: "01/01/2000",
//                 dateFieldName: "Tirado em ",
//                 suffix: "",
//                 controller: dateController,
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(24, 0, 16, 24),
//                   child: Text(
//                     'Glicose',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.lightBlue,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 30,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(8, 0, 24, 0),
//                   child: SizedBox(
//                     width: 230,
//                     child: NumberField(
//                       hint: "100",
//                       fieldName: "Valor",
//                       suffix: "ml/dl",
//                       controller: valueController,
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           //chamar o save glicemia.
//           Navigator.of(context).pop();
//         },
//         child: Icon(
//           Icons.check,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
