import 'package:flutter/material.dart';

class ItemDaGaveta extends StatelessWidget {
  IconData icone;
  String titulo;
  Function metodoQuandoItemClicado;
  Color? cor;
  ItemDaGaveta({
    required this.metodoQuandoItemClicado,
    required this.icone,
    required this.titulo,
    this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(20),
      onPressed: () {
        metodoQuandoItemClicado();
      },
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Icon(
            icone,
            color: cor,
          ),
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
      ),
    );
  }
}
