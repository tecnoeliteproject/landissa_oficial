import 'package:get/get.dart';

class IndicadorProcessoEmExecucaoC extends GetxController{
  var estadoIndicadorProcesso = EstadoIndicadorProcesso.parado.obs;

  void mudarValorEstadoIndicadorProcesso(EstadoIndicadorProcesso novo){
    estadoIndicadorProcesso.value = novo;
  }

  void parar(){
    mudarValorEstadoIndicadorProcesso(EstadoIndicadorProcesso.parado);
  }
  
  void iniciar(){
    mudarValorEstadoIndicadorProcesso(EstadoIndicadorProcesso.processando);
  }
}

enum EstadoIndicadorProcesso{
  processando,
  parado
}