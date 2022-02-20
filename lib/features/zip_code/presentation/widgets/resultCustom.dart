import 'package:flutter_bloc_zipcode_br/features/zip_code/data/models/zip_code_model.dart';
import 'package:flutter_bloc_zipcode_br/features/zip_code/presentation/bloc/zip_code_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_zipcode_br/services/service_locator.dart';

import 'ConsultaCepComponents.dart';
import 'package:flutter/material.dart';

class ResultCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZipCodeBloc, ZipCodeState>(
      cubit: serviceLocator<ZipCodeBloc>(),
      builder: (context, state) {
        if (state is ZipCodeInitial) {
          return buildInitial();
        }
        if (state is ZipCodeLoading) {
          return buildLoading();
        }

        if (state is ZipCodeError) {
          return buildError(state.error);
        }

        if (state is ZipCodeLoaded) {
          return buildResult(state.cepModel);
        }
        return Container();
      },
    );
  }

  Widget buildInitial() {
    return Center(
      child: Container(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: LinearProgressIndicator(),
    );
  }

  Widget buildError(String errorMessage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
              child: Text(
            'Ops, algo deu errado.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          Expanded(
            child: Center(
              child: Text(errorMessage),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildResult(ZipCodeModel cepModel) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Padding(
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
      ),
    );
  }
}
