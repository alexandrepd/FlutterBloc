import 'package:flutter/material.dart';
import 'features/zip_code/presentation/pages/search_zip_code_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterBloc',
      home: SeachZipCodeScreen(title: 'FlutterBloc - Consulta CEP'),
    );
  }
}
