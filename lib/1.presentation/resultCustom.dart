import 'package:FlutterBloc/features/consulta_cep/1.presentation/ConsultaCepComponents.dart';
import 'package:flutter/material.dart';

class ResultCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black12,
        child: Column(
          children: [
            TextCustom("Cep: "),
            TextCustom("Logradouro: "),
            TextCustom("Complemento: "),
            TextCustom("Bairro: "),
            TextCustom("Localidade: "),
            TextCustom("UF: "),
            TextCustom("IBGE: "),
            TextCustom("Gia: "),
            TextCustom("DDD: "),
            TextCustom("Siafi: "),
          ],
        ),
      ),
    );
  }
}
