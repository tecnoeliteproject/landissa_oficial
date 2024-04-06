import 'package:flutter/material.dart';

import 'imagem_net.dart';

class VisualizadorFotoNet extends StatelessWidget {
  String linkFoto;
  VisualizadorFotoNet({
    required this.linkFoto,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Visualizador de Foto",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ImagemNet(link: linkFoto, cantoArredondado: 0),
    );
  }
}
