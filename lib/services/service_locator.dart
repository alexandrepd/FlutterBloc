import 'package:flutter_bloc_zipcode_br/features/zip_code/presentation/bloc/zip_code_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ZipCodeBloc>(ZipCodeBloc());

// Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());
}
