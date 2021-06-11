import 'package:flutter/material.dart';
import 'dart:math';
import 'package:paciente_digital/utils/app_routes.dart';

class LoginScrenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Center(
            child: Text(
              'Paciente Digital',
              style: TextStyle(
                color: Colors.grey[100],
              ),
            ),
          ),
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromRGBO(10, 47, 17, 0.75),
                Color.fromRGBO(0, 0, 0, 1.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 110),
            child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 300,
                      color: Colors.white,
                    ),
                  ],
                )),
          ),
        ]),
    );
  }
}
