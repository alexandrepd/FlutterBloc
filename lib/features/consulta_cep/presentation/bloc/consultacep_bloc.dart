import 'dart:async';
import 'package:FlutterBloc/features/consulta_cep/data/models/consultaCepModel.dart';
import 'package:FlutterBloc/features/consulta_cep/data/repositories/consultaCepRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'consultacep_event.dart';
part 'consultacep_state.dart';

class ConsultacepBloc extends Bloc<ConsultacepEvent, ConsultaCepState> {
  final ConsultaCepRepository _consultaCepRepository;
  ConsultacepBloc(this._consultaCepRepository) : super(ConsultaCepInitial());

  @override
  Stream<ConsultaCepState> mapEventToState(
    ConsultacepEvent event,
  ) async* {
    if (event is SendCepEvent) {
      yield ConsultaCepLoading();
      try {
        ConsultaCepModel _model =
            await _consultaCepRepository.fetchPlayersByCep(event.cep);
        if (_model == null) {
          yield ConsultaCepInitial();
        } else {
          yield ConsultaCepLoaded(cepModel: _model);
        }
      } catch (e) {
        yield ConsultaCepError(error: e.toString());
      }
    }
  }
}
