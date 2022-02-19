import 'dart:convert';
import 'package:flutter_bloc_zipcode_br/features/zip_code/data/models/zip_code_model.dart';
import 'package:http/http.dart' as http;

class ZipCodeProvider {
  static const int successCode = 200;

  Future<ZipCodeModel> searchByCep(String cep) async {
    final response = await http.get('https://viacep.com.br/ws/$cep/json/');

    return parseResponse(response);
  }

  ZipCodeModel parseResponse(http.Response response) {
    try {
      if (response.statusCode == successCode) {
        final responseString = jsonDecode(response.body);
        return ZipCodeModel.fromJson(responseString);
      } else {
        throw Exception('CEP não encontrato.');
      }
    } catch (e) {
      throw Exception('Ops, estamos com problemas!');
    }
  }
}
