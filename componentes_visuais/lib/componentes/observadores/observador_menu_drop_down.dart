import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ObservadorMenuDropDown extends GetxController{
  RxString valorDropdownButtonSeleccionado = "Selecione o tipo de Entidade".obs;

  mudarValorItemDropdown(String novo){
    valorDropdownButtonSeleccionado.value = novo;
  }
}