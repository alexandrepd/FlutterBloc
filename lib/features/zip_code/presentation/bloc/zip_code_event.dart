part of 'zip_code_bloc.dart';

@immutable
abstract class ZipCodeEvent {}

class SearchCepEvent extends ZipCodeEvent {
  final String cep;
  SearchCepEvent({@required this.cep}) : assert(cep != null);
}

class ClearEvent extends ZipCodeEvent {}
