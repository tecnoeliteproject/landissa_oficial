import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'validadores/validadcao_campos.dart';

class AreaTexto extends StatelessWidget {
  Function? metodoChamadoNaInsersao;
  String? dicaParaCampo;
  String? textoPadrao;
  String? dicaParaErroNoCampo;
  TipoCampoTexto? tipoCampoTexto;
  bool? campoBordado = false;
  bool? campoNaoEditavel = false;
  Icon? icone;

  AreaTexto(
      {this.icone,
      this.campoNaoEditavel,
      this.tipoCampoTexto,
      this.campoBordado,
      this.metodoChamadoNaInsersao,
      this.dicaParaCampo,
      this.dicaParaErroNoCampo,
      this.textoPadrao});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        cursorColor: Colors.black,
        keyboardType: tipoCampoTexto == null
            ? TextInputType.name
            : (tipoCampoTexto == TipoCampoTexto.numero
                ? TextInputType.numberWithOptions(decimal: true)
                : TextInputType.name),
        readOnly: campoNaoEditavel == true ? true : false,
        controller: TextEditingController(
            text: textoPadrao == null ? "" : "$textoPadrao"),
        obscureText: tipoCampoTexto == TipoCampoTexto.palavra_passe,
        onChanged: (valor) {
          if (metodoChamadoNaInsersao != null) {
            metodoChamadoNaInsersao!(valor);
          }
        },
        minLines: 10,
        maxLines: 11,
        decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 12),
            focusColor: Colors.black,
            errorText: dicaParaErroNoCampo,
            hintText: dicaParaCampo,
            border: campoBordado == false
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
            contentPadding: campoBordado == false
                ? EdgeInsets.symmetric(horizontal: -10)
                : EdgeInsets.symmetric(horizontal: 10)),
      ),
    );
  }
}
