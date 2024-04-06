import 'package:componentes_visuais/componentes/validadores/validadcao_campos.dart';
import 'package:get/get.dart';

class ObservadorCampoTexto extends GetxController {
  var valorEmailValido = true.obs;
  var valorNumeroTelefoneValido = true.obs;
  var valorNumeroValido = true.obs;
  var valorPrecoValido = true.obs;
  var valorPalavraPasseValido = true.obs;
  var valorNomeValido = true.obs;
  late ValidacaoCampos _validacaoCampos;

  ObservadorCampoTexto() {
    _validacaoCampos = ValidacaoCampos();
  }

  observarCampo(String valor, TipoCampoTexto tipoCampoTexto) {
    if (tipoCampoTexto == TipoCampoTexto.email) {
      valorEmailValido.value = _validacaoCampos.validarEmail(valor);
    } else if (tipoCampoTexto == TipoCampoTexto.palavra_passe) {
      valorPalavraPasseValido.value =
          _validacaoCampos.validarPalavraPasse(valor);
    } else if (tipoCampoTexto == TipoCampoTexto.nome) {
      valorNomeValido.value = _validacaoCampos.validarNome(valor);
    } else if (tipoCampoTexto == TipoCampoTexto.numero) {
      valorNumeroValido.value = _validacaoCampos.validarNumero(valor);
    } else if (tipoCampoTexto == TipoCampoTexto.preco) {
      valorPrecoValido.value = _validacaoCampos.validarPreco(valor);
    } else if (tipoCampoTexto == TipoCampoTexto.numeroTelefone) {
      valorNumeroTelefoneValido.value =
          _validacaoCampos.validarNumeroTelefone(valor);
    }
  }

  observarCampoAlteracaoPalavraPasse(List<String> lista_palavra_passe_e_antiga,
      TipoCampoTexto tipoCampoTexto) {
    valorPalavraPasseValido.value = _validacaoCampos
        .validarAlteracaoPalavraPasse(lista_palavra_passe_e_antiga);
  }

  mudarValorValido(bool valor, TipoCampoTexto tipoCampoTexto) {
    if (tipoCampoTexto == TipoCampoTexto.email) {
      valorEmailValido.value = true;
    } else if (tipoCampoTexto == TipoCampoTexto.palavra_passe) {
      valorPalavraPasseValido.value = true;
    } else if (tipoCampoTexto == TipoCampoTexto.nome) {
      valorNomeValido.value = true;
    } else if (tipoCampoTexto == TipoCampoTexto.numero) {
      valorNumeroValido.value = true;
    } else if (tipoCampoTexto == TipoCampoTexto.preco) {
      valorPrecoValido.value = true;
    } else if (tipoCampoTexto == TipoCampoTexto.numeroTelefone) {
      valorNumeroTelefoneValido.value = true;
    }
  }
}
