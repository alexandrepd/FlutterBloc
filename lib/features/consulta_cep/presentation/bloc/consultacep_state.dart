part of 'consultacep_bloc.dart';

@immutable
abstract class ConsultaCepState {}

class ConsultaCepInitial extends ConsultaCepState {}

class ConsultaCepLoading extends ConsultaCepState {}

class ConsultaCepLoaded extends ConsultaCepState {
  final ConsultaCepModel cepModel;
  ConsultaCepLoaded({@required this.cepModel});
}

class ConsultaCepError extends ConsultaCepState {
  final String error;
  ConsultaCepError({@required this.error});
}
