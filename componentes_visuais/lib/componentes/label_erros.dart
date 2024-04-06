import 'package:flutter/material.dart';

class LabelErros extends StatelessWidget {
  String? sms;
  LabelErros({
    this.sms,
  });

  @override
  Widget build(BuildContext context) {
    return Text(sms!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: Colors.red,
        ));
  }
}
