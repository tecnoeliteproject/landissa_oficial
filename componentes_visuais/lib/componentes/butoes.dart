import 'package:componentes_visuais/dialogo/toast.dart';
import 'package:flutter/material.dart';

class ModeloButao extends StatelessWidget {
  Function? metodoChamadoNoClique;
  Function? metodoChamadoNoLongoClique;
  String? tituloButao;
  BuildContext? contexto;
  bool? butaoHabilitado;
  IconData? icone;
  Color? corButao;
  Color? corTitulo;
  bool? butaoNaoArredondado = false;

  ModeloButao(
      {this.contexto,
      this.corButao,
      this.butaoNaoArredondado,
      this.tituloButao,
      this.icone,
      this.corTitulo,
      this.butaoHabilitado,
      this.metodoChamadoNoClique,
      this.metodoChamadoNoLongoClique});

  @override
  Widget build(contexto) {
    return Container(
      height: 50,
      child: IgnorePointer(
        ignoring: butaoHabilitado == false || butaoHabilitado == null,
        child: MaterialButton(
          child: icone == null
              ? Text(
                  tituloButao ?? "",
                  style: TextStyle(color: corTitulo ?? null),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      tituloButao ?? "",
                      style: TextStyle(color: corTitulo ?? Colors.white),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      icone,
                      color: Colors.white,
                    )
                  ],
                ),
          color: butaoHabilitado == true ? corButao : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(
                butaoNaoArredondado == false ? 0 : 20),
          ),
          onPressed: () {
            if (metodoChamadoNoClique != null) {
              metodoChamadoNoClique!();
            }
          },
          onLongPress: () {
            if (metodoChamadoNoLongoClique != null) {
              metodoChamadoNoLongoClique!();
            }
          },
        ),
      ),
    );
  }
}

class ButaoBarraBaixoApp extends StatelessWidget {
  Function? metodoChamadoNoClique;
  String? tituloButao;
  BuildContext? contexto;
  bool? butaoHabilitado;
  IconData? icone;
  Color? corButao;
  bool? butaoNaoArredondado = false;

  ButaoBarraBaixoApp({
    this.contexto,
    this.corButao,
    this.butaoNaoArredondado,
    this.tituloButao,
    this.icone,
    this.butaoHabilitado,
    this.metodoChamadoNoClique,
  });

  @override
  Widget build(contexto) {
    return Container(
      height: 50,
      child: Container(
        child: icone == null
            ? Text(
                tituloButao ?? "",
                style: TextStyle(color: Colors.white),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    icone,
                    color: Colors.white,
                  ),
                  Text(tituloButao ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      )),
                ],
              ),
        color: corButao == null ? Colors.white : corButao,
        // shape: RoundedRectangleBorder(
        //   borderRadius:
        //       new BorderRadius.circular(butaoNaoArredondado == false ? 0 : 20),
        // ),
        // onPressed:
        //     butaoHabilitado == false ? null : () => metodoChamadoNoClique!(),
      ),
    );
  }
}

class ButaoFlutuante extends StatelessWidget {
  Function? metodoChamadoNoClique;
  String? tituloButao;

  ButaoFlutuante({
    this.metodoChamadoNoClique,
    this.tituloButao,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$tituloButao",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 8, color: Colors.red),
        ),
        FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            metodoChamadoNoClique!();
          },
          child: Icon(
            Icons.add,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
