import 'package:flutter/material.dart';

class ImagemNet extends StatelessWidget {
  ImagemNet({
    Key? key,
    required this.link,
    this.tamanhoLabel,
    this.label,
    required this.cantoArredondado,
  }) : super(key: key);

  final String? link;
  final String? label;
  double? tamanhoLabel;
  double? cantoArredondado;

  @override
  Widget build(BuildContext context) {
    if (link == null || link!.isEmpty) {
      return Container(
          child: Text(
            label ?? "Sem Imagem",
            style: TextStyle(fontSize: tamanhoLabel),
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(cantoArredondado!)));
    }
    var imagem = Image.network(
      link!,
      fit: BoxFit.cover,
      loadingBuilder: (x, y, z) {
        if (z == null) {
          return y;
        }
        return Center(
          child: CircularProgressIndicator(
            value: z.expectedTotalBytes != null
                ? z.cumulativeBytesLoaded / z.expectedTotalBytes!
                : null,
          ),
        );
      },
    );

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: imagem.image, fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(cantoArredondado!)),
    );
  }
}
