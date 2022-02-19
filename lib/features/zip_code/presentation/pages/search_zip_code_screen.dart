import 'package:flutter_bloc_zipcode_br/features/zip_code/data/repositories/zip_code_repository.dart';
import 'package:flutter_bloc_zipcode_br/features/zip_code/presentation/bloc/zip_code_bloc.dart';
import 'package:flutter_bloc_zipcode_br/features/zip_code/presentation/widgets/editCustom.dart';
import 'package:flutter_bloc_zipcode_br/features/zip_code/presentation/widgets/resultCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeachZipCodeScreen extends StatefulWidget {
  final String title;
  SeachZipCodeScreen({Key key, this.title}) : super(key: key);

  @override
  _SeachZipCodeScreenState createState() => _SeachZipCodeScreenState();
}

class _SeachZipCodeScreenState extends State<SeachZipCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ZipCodeBloc>(
      lazy: false,
      create: (_) => ZipCodeBloc(zipCodeRepository: ZipCodeRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Builder(builder: (context) {
                return EditCustom(getZipCode: (zipCode) {
                  BlocProvider.of<ZipCodeBloc>(context)
                      .add(SearchCepEvent(cep: zipCode));
                });
              }),
              ResultCustom(),
            ],
          ),
        ),
      ),
    );
  }
}
