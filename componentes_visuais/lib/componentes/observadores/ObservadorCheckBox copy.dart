import 'package:get/get.dart';

class ObservadorCheckBox extends GetxController {
  Rx<bool> valor = Rx<bool>(false);

  void mudarValor(bool novo) {
    valor.value = novo;
  }
}
