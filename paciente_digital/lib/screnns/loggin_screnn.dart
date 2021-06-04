import 'package:flutter/material.dart';
import 'package:paciente_digital/routs/app_routes.dart';

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
      body: Container(
        color: Theme.of(context).accentColor,
        child: Column(
          children: [
            Container(
              height: 120,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.admin_panel_settings,
                size: 300,
                color: Colors.amberAccent,
              ),
            ),
            Container(
              height: 80,
            ),
            FloatingActionButton(
             splashColor: Colors.white60,
              elevation: 10,
              backgroundColor: Theme.of(context).primaryColor,
              child: Container(
                child: Text('Entrar'),
              ),
              onPressed: () {
               Navigator.of(context).pushReplacementNamed(AppRoutes.MAIN);
              },
            ),
          ],
        ),
      ),
    );
  }
}
