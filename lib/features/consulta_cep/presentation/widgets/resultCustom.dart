import 'package:FlutterBloc/features/consulta_cep/presentation/bloc/consultacep_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ConsultaCepComponents.dart';
import 'package:flutter/material.dart';

class ResultCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ConsultacepBloc, ConsultaCepState>(
        builder: (context, state) {
          if (state is ConsultaCepFetchingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ConsultaCepErrorState) {
            return Center(
              child: Text(state.error),
            );
          }

          if (state is ConsultaCepFetchedState) {
            return Container(
              color: Colors.black12,
              child: Column(
                children: [
                  TextCustom('Cep:', state.cepModel.cep),
                  TextCustom("Logradouro:", state.cepModel.logradouro),
                  TextCustom("Complemento:", state.cepModel.complemento),
                  TextCustom("Bairro:", state.cepModel.bairro),
                  TextCustom("Localidade:", state.cepModel.localidade),
                  TextCustom("UF:", state.cepModel.uf),
                  TextCustom("IBGE:", state.cepModel.ibge),
                  TextCustom("Gia:", state.cepModel.gia),
                  TextCustom("DDD:", state.cepModel.ddd),
                  TextCustom("Siafi:", state.cepModel.siafi),
                ],
              ),
            );
          } else {
            return Expanded(child: Column());
          }
        },
      ),
    );
  }
}