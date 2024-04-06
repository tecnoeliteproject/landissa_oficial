class ValidacaoCampos {
  static bool camposVazio(List<String> listaCampos) {
    var existe = listaCampos.firstWhere((element) => element.isEmpty,
        orElse: (() => " "));
    return existe.isEmpty;
  }

  bool validarEmail(String email) {
    return email.contains("@");
  }

  bool validarPalavraPasse(String palavra_passe) {
    if (palavra_passe.length < 8) {
      return false;
    }
    return true;
  }

  bool validarAlteracaoPalavraPasse(List<String> lista_palavra_passe_e_antiga) {
    if (lista_palavra_passe_e_antiga[0].length < 8 ||
        lista_palavra_passe_e_antiga[0] != lista_palavra_passe_e_antiga[1]) {
      return false;
    }
    return true;
  }

  bool validarNome(String nome) {
    if (RegExp(
            """^[A-ZA-Z\u00C0-\u00D6\u00D8-\u00f6\u00f8-\u00ff\s]+(([',. -][A-ZA-Z\u00C0-\u00D6\u00D8-\u00f6\u00f8-\u00ff\s])?[A-ZA-Z\u00C0-\u00D6\u00D8-\u00f6\u00f8-\u00ff\s]*)*""")
        .hasMatch(nome)) {
      return true;
    }
    return false;
  }

  bool validarGenerico() {
    return true;
  }

  bool validarNumero(String valor) {
    try {
      int.parse(valor);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool validarPin(String valor) {
    if (valor.length < 8) {
      return false;
    }
    if (validarNumero(valor) == false) {
      return false;
    }
    return valor.length >= 8;
  }

  bool validarPreco(String valor) {
    try {
      double.parse(valor);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool validarNumeroTelefone(String valor) {
    try {
      int.parse(valor);
      return valor.length == 9;
    } catch (e) {
      return false;
    }
  }
}

enum TipoCampoTexto {
  generico,
  nome,
  email,
  numero,
  preco,
  numeroTelefone,
  palavra_passe,
  alteracao_palavra_passe
}
