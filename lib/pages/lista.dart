import 'package:filmes_ui/model/filme.dart';
import 'package:filmes_ui/model/filme_detalhe.dart';
import 'package:filmes_ui/pages/detalhes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Lista extends StatefulWidget {
  
  final List<FilmeInfoGeral> listaFilmes;

  const Lista({super.key, required this.listaFilmes});

  @override
  State<Lista> createState() => _ListaState(listaFilmes);
}

class _ListaState extends State<Lista> {

  List<FilmeInfoGeral> listaFilmes;
  _ListaState(this.listaFilmes);

  @override
  Widget build(BuildContext context) {
    listaFilmes = widget.listaFilmes;
    return Expanded(child: ListView.builder(itemCount: listaFilmes.length,itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: () => clickFilme(context, index), child: ListTile(
            title: Text(listaFilmes[index].nome),
            subtitle: Text(listaFilmes[index].ano) ,
            leading: Image(image: NetworkImage(listaFilmes[index].image), width: 100, height: 100,),          
          )),
      );
    }));
  }

  Future<void> clickFilme (BuildContext context, int index) async {
    FilmeDetalhe filme = await buscarFilme(listaFilmes[index].id);

    Navigator.push(context, MaterialPageRoute(builder: (context) => Detalhes(filme: filme)));
  }

  Future buscarFilme(String id) async {
    String url = 'http://www.omdbapi.com/?apikey=12ce0d31&i=${id}';
    
    var response = await http.get(Uri.parse(url));
    var body = response.body;
    var filme = jsonDecode(body);
    
    return FilmeDetalhe(
      filme['Title'],
      filme["Year"],
      filme["Poster"], 
      filme['Runtime'],
      filme['Director'],
      filme['Plot'],
      filme['imdbRating']);    
  }
  
}