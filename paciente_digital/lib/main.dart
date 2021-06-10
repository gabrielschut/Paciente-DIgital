import 'package:flutter/material.dart';
import 'package:paciente_digital/screnns/home_screnn.dart';
import 'package:paciente_digital/screnns/loggin_screnn.dart';
import 'package:paciente_digital/utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScrenn(),
     routes: {
        AppRoutes.MAIN : (ctx)=> HomeScrenn(),
       AppRoutes.TELADEBLIQUEIO : (ctx)=> LoginScrenn(),
     },
    );
  }
}

