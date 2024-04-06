import 'package:get/get.dart';

class ObservadorListaTipoInstituicoes extends GetxController {
  RxList listaTipoInstituicoes = [].obs;

  alterarLista(List novaLista) {
    listaTipoInstituicoes.value = novaLista;
  }
}
