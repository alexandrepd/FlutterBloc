import 'package:FlutterBloc/features/consulta_cep/data/models/consultaCepModel.dart';
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
        margin: EdgeInsets.all(10.0),
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
            if (state is ConsultaCepInitial) {
              return buildInitial();
            }
            if (state is ConsultaCepLoading) {
              return buildLoading();
            }

            if (state is ConsultaCepError) {
              return buildError(state.toString());
            }

            if (state is ConsultaCepLoaded) {
              return buildResult(state.cepModel);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget buildInitial() {
    return Center(
      child: Container(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildError(String errorMessage) {
    return Center(
      child: Text(errorMessage),
    );
  }

  Widget buildResult(ConsultaCepModel cepModel) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextCustom('Cep:', cepModel.cep),
          TextCustom("Logradouro:", cepModel.logradouro),
          TextCustom("Complemento:", cepModel.complemento),
          TextCustom("Bairro:", cepModel.bairro),
          TextCustom("Localidade:", cepModel.localidade),
          TextCustom("UF:", cepModel.uf),
          TextCustom("IBGE:", cepModel.ibge),
          TextCustom("Gia:", cepModel.gia),
          TextCustom("DDD:", cepModel.ddd),
          TextCustom("Siafi:", cepModel.siafi),
        ],
      ),
    );
  }
}
