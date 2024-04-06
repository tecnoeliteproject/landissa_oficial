import 'package:flutter/material.dart';

import 'imagem_circulo.dart';

class InfoGaveta extends StatelessWidget {
  String titulo;
  Color? cor;
  InfoGaveta({
    required this.titulo,
    this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 20,
        ),
        ImagemNoCirculo(Icon(Icons.person), .03),
        SizedBox(
          width: 20,
        ),
        Text(
          "$titulo",
          style: TextStyle(color: cor),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
