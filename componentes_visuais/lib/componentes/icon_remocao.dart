import 'package:flutter/material.dart';

class IconRemocao extends StatelessWidget {
  IconRemocao({
    Key? key,
    required this.accao,
    this.iconeComFundo,
  }) : super(key: key);

  final Function accao;
  bool? iconeComFundo = true;

  var icone = Icon(
    Icons.delete,
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
            accao();
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
