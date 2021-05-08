import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.black,
        title: Text ("Alicia Widar"),
        actions: [

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
            },
          ),

        ],
      ),
      body:Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            title: Text("Início"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text("Sobre"),
              icon: Icon(Icons.whatshot)
          )

        ],
      ),
    );
  }
}
