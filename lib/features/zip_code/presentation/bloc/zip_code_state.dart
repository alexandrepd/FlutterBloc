part of 'zip_code_bloc.dart';

@immutable
abstract class ZipCodeState {}

class ZipCodeInitial extends ZipCodeState {}

class ZipCodeLoading extends ZipCodeState {}

class ZipCodeLoaded extends ZipCodeState {
  final ZipCodeModel cepModel;
  ZipCodeLoaded({@required this.cepModel});
}

class ZipCodeError extends ZipCodeState {
  final String error;
  ZipCodeError({@required this.error});
}

class ZipCodeNotFound extends ZipCodeState {}
