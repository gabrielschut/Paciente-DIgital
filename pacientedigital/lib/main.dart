import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pacientedigital/utils/app_routes.dart';
import 'package:pacientedigital/view/home_screnn.dart';
import 'package:pacientedigital/view/navigation_screnn.dart';
import 'package:pacientedigital/view/paciente_screnn.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      initialRoute: AppRoute.TELAPACIENTES,
      routes: {
        AppRoute.TELAPACIENTES : (context)=> PacienteScrenn(),
        AppRoute.TELAPRESSAO : (context)=> NavigationScrenn(),
      },
    );
  }
}


