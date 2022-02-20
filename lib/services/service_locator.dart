import 'package:flutter_bloc_zipcode_br/features/zip_code/data/repositories/zip_code_repository.dart';
import 'package:flutter_bloc_zipcode_br/features/zip_code/presentation/bloc/zip_code_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerSingleton<ZipCodeBloc>(
      ZipCodeBloc(zipCodeRepository: ZipCodeRepository()));

// Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());
}
