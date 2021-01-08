import 'package:FlutterBloc/features/consulta_cep/data/datasources/consultaCepProvider.dart';
import 'package:FlutterBloc/features/consulta_cep/data/models/consultaCepModel.dart';

class ConsultaCepRepository {
  ConsultaCepProvider _consultaCepProvider = ConsultaCepProvider();

  Future<ConsultaCepModel> fetchPlayersByCep(String cep) =>
      _consultaCepProvider.fetchPlayersByCep(cep);
}
