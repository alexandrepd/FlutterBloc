part of 'consultacep_bloc.dart';

@immutable
abstract class ConsultaCepState {}

class ConsultaCepInitial extends ConsultaCepState {}

class ConsultaCepFetchingState extends ConsultaCepState {}

class ConsultaCepFetchedState extends ConsultaCepState {
  final ConsultaCepModel cepModel;
  ConsultaCepFetchedState({@required this.cepModel});
}

class ConsultaCepErrorState extends ConsultaCepState {}

class ConsultaCepEmptyState extends ConsultaCepState {}
