import 'package:FlutterBloc/features/consulta_cep/presentation/pages/consulta_cep_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterBloc',
      home: ConsultaCepScreen(title: 'FlutterBloc - Consulta CEP'),
    );
  }
}
