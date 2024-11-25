import 'package:filmes_ui/model/filme_detalhe.dart';
import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  final FilmeDetalhe filme;

  const Detalhes({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(                    
            children: [
              Image(image: NetworkImage(filme.image),width: 500, height: 500,),
              Text('${filme.nome} - ${filme.ano}'),
              const SizedBox(height: 10,),
              Text('Duração: ${filme.duracao}'),
              Text('Diretor: ${filme.diretor}'),
              Text('Sinopse: ${filme.sinopse}'),
              Text('Nota IMDB: ${filme.notaImdb}'),
              ElevatedButton(onPressed: () => voltarPagina(context), child: const Text('Voltar'))
            ],
          )
        ),
      ),
    );
  }

  void voltarPagina(BuildContext context){
    Navigator.pop(context);
  }
}