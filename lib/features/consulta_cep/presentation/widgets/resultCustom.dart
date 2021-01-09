import 'package:FlutterBloc/features/consulta_cep/presentation/bloc/consultacep_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ConsultaCepComponents.dart';
import 'package:flutter/material.dart';

class ResultCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
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
              return Padding(
                padding: EdgeInsets.all(10),
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
              return Container();
            }
          },
        ),
      ),
    );
  }
}
