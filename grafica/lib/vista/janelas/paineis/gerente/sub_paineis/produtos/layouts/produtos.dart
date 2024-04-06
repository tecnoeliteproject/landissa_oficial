import 'package:flutter/material.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/sub_paineis/produtos/layouts/produtos_c.dart';

import '../../../../../../componentes/item_produto.dart';

class LayoutProdutos extends StatelessWidget {
  final List<Produto> lista;
  Function(Produto produto)? accaoAoClicarCadaProduto;
  ProdutosC? c;
  LayoutProdutos({required this.lista, this.c, this.accaoAoClicarCadaProduto});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, indice) {
          return InkWell(
            onTap: () {
              if (accaoAoClicarCadaProduto != null) {
                accaoAoClicarCadaProduto!(lista[indice]);
              }
              return;
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
              child: ItemProduto(
                produto: lista[indice],
                c: c,
              ),
            ),
          );
        });
  }
}
