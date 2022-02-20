import 'package:flutter/material.dart';
import 'package:flutter_bloc_zipcode_br/features/zip_code/presentation/widgets/ConsultaCepComponents.dart';

class SeachZipCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.only(top: 80.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.green[800],
                Colors.green[700],
                Colors.yellow[600],
                Colors.yellow[400],
              ]),
        ),
        child: Column(
          children: [
            Text('We only search Brazil zip code'),
            Text('ex: 15370-496'),
            EditCustom(),
            ResultCustom(),
          ],
        ),
      ),
    ));
  }
}
