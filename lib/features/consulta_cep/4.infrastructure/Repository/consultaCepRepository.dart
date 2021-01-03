import 'package:FlutterBloc/features/consulta_cep/3.domain/consultaCepModel.dart';
import 'package:FlutterBloc/features/consulta_cep/4.infrastructure/Provider/consultaCepProvider.dart';

class ConsultaCepRepository {
  ConsultaCepProvider _consultaCepProvider = ConsultaCepProvider();

  Future<ConsultaCepModel> fetchPlayersByCep(String cep) =>
      _consultaCepProvider.fetchPlayersByCep(cep);
}
