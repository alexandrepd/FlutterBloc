import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String texto;

  const TextCustom(this.texto);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(texto),
      ),
    );
  }
}
