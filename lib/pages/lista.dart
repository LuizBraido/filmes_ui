import 'package:filmes_ui/model/filme.dart';
import 'package:flutter/material.dart';


class Lista extends StatefulWidget {
  
  List<Filme> listaFilmes;

  Lista(this.listaFilmes, {super.key});

  @override
  State<Lista> createState() => _ListaState(listaFilmes);
}

class _ListaState extends State<Lista> {

  List<Filme> listaFilmes;
  _ListaState(this.listaFilmes);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(itemCount: listaFilmes.length,itemBuilder: (context, index) {
      return ListTile(
        title: Text(listaFilmes[index].nome),
        subtitle: Text(listaFilmes[index].ano) ,
        leading: Image(image: NetworkImage(listaFilmes[index].image), width: 100, height: 100,),
      );
    }));
  }

}