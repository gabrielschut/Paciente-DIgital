import 'package:flutter/material.dart';
import 'package:paciente_digital/screnns/loggin_screnn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScrenn(),
    );
  }
}

