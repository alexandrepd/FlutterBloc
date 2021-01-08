import 'dart:convert';

import 'package:FlutterBloc/features/consulta_cep/data/models/consultaCepModel.dart';
import 'package:http/http.dart' as http;

class ConsultaCepProvider {
  final successCode = 200;

  Future<ConsultaCepModel> fetchPlayersByCep(String cep) async {
    final response = await http.get('https://viacep.com.br/ws/$cep/json/');

    return parseResponse(response);
  }

  ConsultaCepModel parseResponse(http.Response response) {
    final responseString = jsonDecode(response.body);

    if (response.statusCode == successCode) {
      return ConsultaCepModel.fromJson(responseString);
    } else {
      throw Exception('failed to load players');
    }
  }
}
