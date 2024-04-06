String formatarMesOuDia(valor) {
  String valorFormatado = "$valor";
  if (valorFormatado.length == 2) {
    return valorFormatado;
  }
  return "0$valorFormatado";
}

String formatarData(DateTime data, {bool semHora = false}) {
  if (semHora == true) {
    return "${formatarMesOuDia(data.day)}-${formatarMesOuDia(data.month)}-${data.year}";
  }
  return "${formatarMesOuDia(data.day)}-${formatarMesOuDia(data.month)}-${data.year} às ${formatarMesOuDia(data.hour)}:${formatarMesOuDia(data.minute)}";
}
