import 'package:FlutterBloc/features/consulta_cep/presentation/bloc/consultacep_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCustom extends StatelessWidget {
  final String caption;
  final TextEditingController controller;
  ButtonCustom(this.caption, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          child: Text(caption),
          onPressed: () {
            BlocProvider.of<ConsultacepBloc>(context)
                .add(SendCepEvent(cep: controller.text));
            print('clicked');
          }),
    );
  }
}
