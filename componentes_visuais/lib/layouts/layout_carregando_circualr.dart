import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutCarregandoCircrular extends StatelessWidget {
  String informacao;
  Color? cor;

  LayoutCarregandoCircrular(this.informacao, {this.cor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CircularProgressIndicator(
              color: cor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(informacao),
          )
        ],
      ),
    );
  }
}
