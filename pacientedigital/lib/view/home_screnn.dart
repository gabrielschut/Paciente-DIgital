import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var snapshots = FirebaseFirestore.instance
        .collection('todo')
        .where('Excluido', isEqualTo: false)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Paciente Digital')),
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
                child: Text('Nenhuma tarefa pra fazer!'),
              );
            } else {
              return ListView.builder(
                  itemCount: asyncspanshot.data.docs.length,
                  itemBuilder: (BuildContext context, int i) {
                    var item = asyncspanshot.data.docs[i];

                    return Card(
                      elevation: 8,
                      child: ListTile(
                        leading: IconButton(
                          icon: item['dano']
                              ? Icon(Icons.check_circle)
                              : Icon(Icons.check_circle_outline),
                          onPressed: () {
                            item.reference.update({'dano' : !item['dano']});
                          },
                        ),
                        title: Text(item['title']),
                        subtitle: Text(item['description']),
                        trailing: IconButton(
                          icon: CircleAvatar(
                              backgroundColor: Colors.red[300],
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.delete_outline,
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
          return modalDialog(context);
        },
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  modalDialog(BuildContext context){
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    var titulo = TextEditingController();
    var descricao = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Nova Tarefa'),
            content: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Titulo'),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ex.: Fazer compras',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                    ),
                    controller: titulo,
                    validator: (value){
                      if(value.trim().isEmpty){
                        return 'Erro: Campo vazio';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Descrição'),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Ex.: Ir no mercado x por que tempromoção',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                    ),
                    controller: descricao,
                    validator: (value){
                      if(value.trim().isEmpty){
                        return 'Erro: Campo vazio';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      return Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancelar',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.red[300],
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                      child: Text(
                        'Salvar',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 16,
                        ),
                      ),
                    onPressed: () async{
                        if(formkey.currentState.validate()){
                          await FirebaseFirestore.instance.collection('todo').add({
                            'title' : titulo.text,
                            'description' : descricao.text,
                            'Excluido' : false,
                            'dano' : false,
                          });

                          titulo.dispose();
                          descricao.dispose();
                          Navigator.of(context).pop();
                        }
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }
}
