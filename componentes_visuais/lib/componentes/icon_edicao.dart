import 'package:flutter/material.dart';

class IconEdicao extends StatelessWidget {
  IconEdicao({
    Key? key,
    required this.accaoEdicacao,
    this.iconeComFundo,
  }) : super(key: key);

  final Function accaoEdicacao;
  bool? iconeComFundo = true;

  var icone = Icon(
    Icons.edit,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          onTap: () {
            accaoEdicacao();
          },
          child: (iconeComFundo != false && iconeComFundo != null)
              ? icone
              : Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  child: icone,
                ),
        ),
      ),
    );
  }
}
