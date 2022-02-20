import 'dart:async';
import 'package:flutter_bloc_zipcode_br/features/zip_code/data/models/zip_code_model.dart';
import 'package:flutter_bloc_zipcode_br/features/zip_code/data/repositories/zip_code_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'zip_code_event.dart';
part 'zip_code_state.dart';

class ZipCodeBloc extends Bloc<ZipCodeEvent, ZipCodeState> {
  final ZipCodeRepository zipCodeRepository;
  ZipCodeBloc({this.zipCodeRepository}) : super(ZipCodeInitial());

  @override
  Stream<ZipCodeState> mapEventToState(ZipCodeEvent event) async* {
    if (event is SearchCepEvent) {
      yield* searchCep(event);
    } else if (event is ClearEvent) {
      yield ZipCodeInitial();
    }
  }

  Stream<ZipCodeState> searchCep(SearchCepEvent event) async* {
    yield ZipCodeLoading();
    try {
      ZipCodeModel _model = await zipCodeRepository.searchByCep(event.cep);
      if (_model == null) {
        yield ZipCodeLoading();
      } else {
        yield ZipCodeLoaded(cepModel: _model);
      }
    } catch (e) {
      yield ZipCodeError(error: e.message);
    }
  }
}
