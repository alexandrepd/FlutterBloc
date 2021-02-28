import 'package:FlutterBloc/features/consulta_cep/data/repositories/consultaCepRepository.dart';
import 'package:FlutterBloc/features/consulta_cep/presentation/bloc/consultacep_bloc.dart';
import 'package:FlutterBloc/features/consulta_cep/presentation/widgets/ConsultaCepComponents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultaCepScreen extends StatefulWidget {
  ConsultaCepScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ConsultaCepScreenState createState() => _ConsultaCepScreenState();
}

class _ConsultaCepScreenState extends State<ConsultaCepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (_) => ConsultacepBloc(ConsultaCepRepository()),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              EditCustom(),
              ResultCustom(),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
