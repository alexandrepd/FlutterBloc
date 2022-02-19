import 'package:flutter_bloc_zipcode_br/features/zip_code/data/datasources/zip_code_provider.dart';
import 'package:flutter_bloc_zipcode_br/features/zip_code/data/models/zip_code_model.dart';

class ZipCodeRepository {
  ZipCodeProvider _consultaCepProvider = ZipCodeProvider();

  Future<ZipCodeModel> searchByCep(String cep) =>
      _consultaCepProvider.searchByCep(cep);
}
