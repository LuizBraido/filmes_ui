import 'package:filmes_ui/model/filme.dart';
import 'package:filmes_ui/pages/detalhes.dart';
import 'package:filmes_ui/pages/lista.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController pesquisaController = TextEditingController();
  var pesquisa = '';
  Widget teste = Text('Informe o nome de um filme');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextField(decoration: const InputDecoration(labelText: "Pesquisa"), controller: pesquisaController),
              ElevatedButton(onPressed:()=>pesquisar(), child: const Text('Pesquisar')),
              teste
            ],
          )
        ),
      )
    );
  }

  void pesquisar() {

    setState(() {
      pesquisa = pesquisaController.text;
    });
    
    String url = 'http://www.omdbapi.com/?apikey=12ce0d31&s=$pesquisa';
    buscarFilmes(url).then((body)=>{
      retornaWidget(body)
    });

  }

  Future buscarFilmes(String url) async {
    var response = await http.get(Uri.parse(url));
    var body = response.body;
    var jsonDecodeBody = jsonDecode(body);
    List<Filme> listaFilmes = [];
    for (var filme in jsonDecodeBody["Search"]) {
      listaFilmes.add(Filme(filme['Title'], filme["Year"], filme["Poster"]));
    }
    return listaFilmes;
  }

  void retornaWidget(List<Filme> body) {
    if(pesquisa.length > 4) {
      setState(() {
        teste = Lista(body);
      });
    }
  }
  
}
