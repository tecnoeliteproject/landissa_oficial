import 'package:flutter/material.dart';

import 'imagem_circulo.dart';

class LogoNoCirculo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImagemNoCirculo(Image.asset(
      "lib/recursos/imagens/icones/logo.png",
    ), 0.6);
  }
}

