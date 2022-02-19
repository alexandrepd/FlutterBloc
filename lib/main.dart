import 'package:flutter/material.dart';
import 'package:flutter_bloc_zipcode_br/services/service_locator.dart';
import 'features/zip_code/presentation/pages/search_zip_code_screen.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SeachZipCodeScreen(title: 'Consulta CEP'),
    );
  }
}
