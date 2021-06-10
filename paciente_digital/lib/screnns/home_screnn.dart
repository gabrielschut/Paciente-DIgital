import 'package:flutter/material.dart';

class HomeScrenn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text(
          'Pacientes',
          style: TextStyle(
            color: Colors.grey[100],
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(itemBuilder: (ctx, index)=>
          ListTile(

          ),
      ),
    );
  }
}
