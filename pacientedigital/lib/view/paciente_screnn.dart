import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pacientedigital/utils/app_routes.dart';

class PacienteScrenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var snapshots = FirebaseFirestore.instance
        .collection('Paciente')
        .snapshots();

    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
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
                child: Text('Nenhum paciente cadastrado!'),
              );
            } else {
              return ListView.builder(
                  itemCount: asyncspanshot.data.docs.length,
                  itemBuilder: (BuildContext context, int i) {
                    var item = asyncspanshot.data.docs[i];

                    return Card(
                      elevation: 8,
                      color: item['Diabetico']
                          ?Colors.red[200]
                      : Colors.white,
                      child: ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              '${item['Idade']}',
                              style: TextStyle(
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                          title: TextButton(
                            child: Text(item['Nome'],
                            style: TextStyle(color: Colors.purple),),
                            style: ButtonStyle(
                              alignment: Alignment.topLeft,
                            ),
                            onPressed: () {
                              modalSelecionaMedida(context);
                            },
                          ),
                          subtitle: Text(item['Sexo']),
                          trailing: IconButton(
                                icon: CircleAvatar(
                                    backgroundColor: Colors.brown[300],
                                    foregroundColor: Colors.amber,
                                    child: Icon(
                                      Icons.edit_sharp,
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
          return modalNovoPaciente(context);
        },
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  modalNovoPaciente(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    var nome = TextEditingController();
    var sexo = TextEditingController();
    var idade = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Nova Tarefa'),
              content: Form(
                key: formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nome'),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Ex.: Pedro Alvaro ...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      controller: nome,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'Erro: Campo vazio';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Genero'),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Ex.: Masculino',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      controller: sexo,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'Erro: Campo vazio';
                        }
                        return null;
                      },
                    ),
                    Text('Idade'),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Ex.: 20',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      controller: idade,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Erro: Campo vazio';
                        } else if (double.parse(value) <= 0 ||
                            double.parse(value) >= 120) {
                          return 'Erro : Idade invalida';
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
                      onPressed: () async {
                        if (formkey.currentState.validate()) {
                          await FirebaseFirestore.instance
                              .collection('Paciente')
                              .add({
                            'Nome': nome.text,
                            'Sexo': sexo.text,
                            'Idade': idade.text,
                            'Id': Random().nextInt(1000),
                            'Diabetico': false,
                            'Hipertenso': false,
                          });

                          nome.dispose();
                          sexo.dispose();
                          idade.dispose();
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  modalSelecionaMedida(BuildContext context){
    showDialog(context: context,
        builder: (context){
      return Center(
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          title: Text('Selecione medida'),
          actions: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: (){}, child: Text('Circ.Abdominal')),
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: (){}, child: Text('   Peso   ')),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 20),
                    ElevatedButton(onPressed: (){}, child: Text('  Glicemia  ')),
                    SizedBox(width: 20,),
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pushNamed(AppRoute.TELAPRESSAO);
                    }, child: Text('  Pressão ')),
                  ],
                ),
                IconButton(onPressed: ()=> Navigator.of(context).pop(), icon: Icon(Icons.cancel,size: 35,),
                color: Theme.of(context).errorColor,
                ),
              ],
            ),
          ],
        ),
      );
        });
  }
}
