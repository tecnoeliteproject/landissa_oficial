import 'package:componentes_visuais/componentes/imagem_net.dart';
import 'package:flutter/material.dart';

class ImagemNoCirculo extends StatelessWidget {
  final Widget widgetImagem;
  final double tamanhoCurva;
  const ImagemNoCirculo(
    this.widgetImagem,
    this.tamanhoCurva, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.grey),
      child: widgetImagem,
      width: MediaQuery.of(context).size.width * tamanhoCurva,
      height: MediaQuery.of(context).size.width * tamanhoCurva,
    );
  }
}
