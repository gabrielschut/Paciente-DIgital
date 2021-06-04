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
      body: Container(
        child: GridTile(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(10),
                color: Theme.of(context).primaryColor,
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.account_box_rounded,
                        color: Colors.blueGrey,
                        size: 125,
                      ),
                    ),
                    Column(
                      children: [
                        Text(''),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
