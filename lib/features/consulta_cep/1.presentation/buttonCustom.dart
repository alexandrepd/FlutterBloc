import 'package:FlutterBloc/features/consulta_cep/2.application/consultacep_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCustom extends StatelessWidget {
  final String caption;
  final TextEditingController controller;
  ButtonCustom(this.caption, this.controller);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final _bloc = BlocProvider.of<ConsultacepBloc>(context);

    return Container(
      child: RaisedButton(
          child: Text(caption),
          onPressed: () {
            _bloc.add(SendCepEvent(cep: controller.text));
            print('clicked');
          }),
    );
  }
}
