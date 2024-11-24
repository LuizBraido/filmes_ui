import 'package:flutter/material.dart';

class Detallhes extends StatefulWidget {
  const Detallhes({super.key});

  @override
  State<Detallhes> createState() => _DetallhesState();
}

class _DetallhesState extends State<Detallhes> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Image(image: NetworkImage("https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg"),width: 500, height: 500,),
              Text('[NOME FILME] - [ANO FILME]'),
              Text('Duração: [DURACAO FILME]'),
              Text('Diretor: [DIRETOR FILME]'),
              Text('Sinopse: [PLOT]'),
              Text('Nota IMDB: [NOTA]')
            ],
          )
        ),
      ),
    );
  }
}