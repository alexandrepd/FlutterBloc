import 'package:flutter/material.dart';

class EditCustom extends StatelessWidget {
  final TextEditingController _controller;

  const EditCustom(this._controller);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Digita o cep'),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
