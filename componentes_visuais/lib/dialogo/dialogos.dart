import 'package:componentes_visuais/layouts/layout_carregando_circualr.dart';
import 'package:componentes_visuais/layouts/layout_informacao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mostrarCarregandoDialogoDeInformacao(String informacao,
    {bool? fechavel, Color? cor}) {
  fecharDialogoCasoAberto();
  try {
    Get.defaultDialog(
        barrierDismissible: fechavel == null ? false : true,
        title: "",
        content: LayoutCarregandoCircrular(
          informacao,
          cor: cor,
        ));
  } catch (e) {
    mostrarCarregandoDialogoDeInformacao(informacao,
        fechavel: fechavel, cor: cor);
  }
}

mostrarDialogoDeInformacao(String informacao,
    {bool? fechavel,
    Function? accaoNaNovaTentativa,
    Function? accaoAoSair,
    bool? naoFechar}) {
  if (naoFechar == null && naoFechar == false) {
    fecharDialogoCasoAberto();
  }
  Get.defaultDialog(
      onWillPop: () async {
        if (accaoAoSair != null) {
          accaoAoSair();
        }
        return true;
      },
      barrierDismissible: fechavel ?? true,
      title: "",
      content: LayoutInformacao(
        informacao,
        accaoNaNovaTentativa,
      ));
}

mostrarDialogoDeLayou(Widget layout, {bool? naoFechar, bool? layoutCru}) {
  if (naoFechar == null && naoFechar == false) {
    fecharDialogoCasoAberto();
  }
  Get.defaultDialog(
      title: "",
      content: layoutCru == true
          ? layout
          : Container(
              height: 300, child: SingleChildScrollView(child: layout)));
}

mostrarSnack(String informacao,
    [bool? fechavel, Function? accaoNaNovaTentativa]) {
  Get.snackbar("", informacao.replaceAll("Erro:", ""),
      backgroundColor: Color.fromRGBO(86, 0, 78, 1), colorText: Colors.white);
}

int c = 0;
void fecharDialogoCasoAberto() {
  if (c == 4) {
    c = 0;
    return;
  }
  try {
    var teste = Get.isDialogOpen;
    bool avaliacao = teste == null ? false : Get.isDialogOpen!;
    if (avaliacao == true) {
      Get.back();
    }
    c++;
  } catch (e) {
    fecharDialogoCasoAberto();
  }
}

void voltar() {
  Get.back();
}
