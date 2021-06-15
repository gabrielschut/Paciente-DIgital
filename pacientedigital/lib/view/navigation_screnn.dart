import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NavigationScrenn extends StatelessWidget {

  var snapshots = FirebaseFirestore.instance
      .collection('Pressao')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Center(child: Text('Slecione medida')),
      ),
      body: StreamBuilder(
          stream: snapshots,
          builder: (context, AsyncSnapshot<QuerySnapshot> asyncspanshot) {
            if (asyncspanshot.hasError) {
              return Center(
                child: Text('${asyncspanshot.error}'),
              );
            } else if (asyncspanshot.connectionState ==
                ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (asyncspanshot.data.docs.length == 0) {
              return Center(
                child: Text('Nenhum paciente cadastrado!'),
              );
            } else {
              return ListView.builder(
                  itemCount: asyncspanshot.data.docs.length,
                  itemBuilder: (BuildContext context, int i) {
                    var item = asyncspanshot.data.docs[i];


                    return Card(
                      elevation: 8,
                      child: ListTile(
                        title: Text('Pressao Max  '+ item['PMax'],
                          style: TextStyle(color: Colors.black87),
                        ),
                        subtitle: Text('Pressao Min  '+item['PMin'],
                          style: TextStyle(color: Colors.black87),
                        ),
                        trailing: IconButton(
                          icon: CircleAvatar(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.delete,
                              )),
                          onPressed: () {
                            item.reference.delete();
                          },
                        ),
                      ),
                    );
                  });
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return; //modalNovoPaciente(context);
        },
        tooltip: 'Adicionar',
        child: Icon(Icons.edit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  }
