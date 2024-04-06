import 'package:get/get.dart';

class ObservadorButoes extends GetxController {
  var butaoFinalizarCadastroInstituicao = false.obs;

  var butaoInterruptorHabilitado = true.obs;

  mudarValorFinalizarCadastroInstituicao(List<String> listaValoresFormulario,
      List<bool> listaValoresFormularioValidados) {
    bool contorlador = true;
    listaValoresFormularioValidados.forEach((element) {
      if (element == false) {
        contorlador = false;
      }
    });
    listaValoresFormulario.forEach((element) {
      if (element.isEmpty) {
        contorlador = false;
      } 
    });
    butaoFinalizarCadastroInstituicao.value = contorlador;
  }

  mudarValorButaoInterruptorHabilitado(bool novo) {
    butaoInterruptorHabilitado.value = novo;
  }
}
