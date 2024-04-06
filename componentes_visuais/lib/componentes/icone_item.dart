import 'package:flutter/material.dart';

class IconeItem extends StatelessWidget {
  IconData icone;
  String titulo;
  Function metodoQuandoItemClicado;
  Function? metodoQuandoItemClicadoLongo;
  Color? cor;
  double? tamanho;
  IconeItem({
    required this.metodoQuandoItemClicado,
    this.metodoQuandoItemClicadoLongo,
    required this.icone,
    required this.titulo,
    this.cor,
    this.tamanho,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        if (metodoQuandoItemClicadoLongo != null) {
          metodoQuandoItemClicadoLongo!();
        }
      },
      onTap: () {
        metodoQuandoItemClicado();
      },
      child: Column(
        children: [
          Icon(
            icone,
            color: cor,
            size: tamanho,
          ),
          Visibility(
            visible: titulo.isNotEmpty,
            child: Text(
              "$titulo",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
