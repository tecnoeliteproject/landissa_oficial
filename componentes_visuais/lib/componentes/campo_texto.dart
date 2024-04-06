import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'validadores/validadcao_campos.dart';

class CampoTexto extends StatelessWidget {
  BuildContext context;
  Function(String dado)? metodoChamadoNaInsersao;
  String? dicaParaCampo;
  String? textoPadrao;
  String? dicaParaErroNoCampo;
  TipoCampoTexto? tipoCampoTexto;
  bool? campoBordado = false;
  bool? campoOculto = false;
  bool? campoNaoEditavel = false;
  Icon? icone;
  bool? autoFoco;
  Function? accaoAoTocarNoCampo;
  Function? accaoAoTerminarInsercao;
  CampoTexto(
      {this.icone,
      this.campoNaoEditavel,
      required this.context,
      this.accaoAoTocarNoCampo,
      this.accaoAoTerminarInsercao,
      this.tipoCampoTexto,
      this.autoFoco,
      this.campoBordado,
      this.campoOculto,
      this.metodoChamadoNaInsersao,
      this.dicaParaCampo,
      this.dicaParaErroNoCampo,
      this.textoPadrao});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: campoBordado == false
          ? BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.black.withOpacity(0.1),
            )
          : BoxDecoration(),
      child: Center(
        child: TextFormField(
          onFieldSubmitted: (valor) {
            if (accaoAoTerminarInsercao != null) {
              accaoAoTerminarInsercao!();
            }
          },
          onTap: () {
            if (accaoAoTocarNoCampo != null) {
              accaoAoTocarNoCampo!();
            }
          },
          autofocus: autoFoco ?? false,
          cursorColor: Colors.black,
          keyboardType: tipoCampoTexto == null
              ? TextInputType.name
              : (tipoCampoTexto == TipoCampoTexto.numero
                  ? TextInputType.numberWithOptions(decimal: true)
                  : TextInputType.name),
          readOnly: campoNaoEditavel == true ? true : false,
          controller: TextEditingController(
              text: textoPadrao == null ? "" : "$textoPadrao"),
          obscureText:
              campoOculto ?? tipoCampoTexto == TipoCampoTexto.palavra_passe,
          decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 12),
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: icone,
              ),
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
          onChanged: (valor) {
            if (metodoChamadoNaInsersao != null) {
              metodoChamadoNaInsersao!(valor);
            }
          },
        ),
      ),
    );
  }
}
