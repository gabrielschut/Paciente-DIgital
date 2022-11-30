// import 'package:flutter/material.dart';
// import 'package:paciente_digital/widgets/components/date_picker_field.dart';
// import 'package:paciente_digital/widgets/components/number_field.dart';
//
// class NewFreqCardiaca extends StatefulWidget {
//   const NewFreqCardiaca({Key? key}) : super(key: key);
//
//   @override
//   State<NewFreqCardiaca> createState() => _NewFreqCardiacaState();
// }
//
// class _NewFreqCardiacaState extends State<NewFreqCardiaca> {
//   final TextEditingController _dateController = TextEditingController();
//   TextEditingController frequenciaController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             "Frequência Cardiaca",
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
//                 controller: _dateController,
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(24, 0, 16, 24),
//                   child: Text(
//                     'Frequência',
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
//                     child: NumberFielda(
//                       hint: "80.5",
//                       fieldName: "Batimentos / min",
//                       suffix: "/min",
//                       controller: frequenciaController,
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
//           //chamar o save frequencia cardiaca.
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
