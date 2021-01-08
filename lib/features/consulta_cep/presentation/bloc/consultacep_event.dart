part of 'consultacep_bloc.dart';

@immutable
abstract class ConsultacepEvent {}

class SendCepEvent extends ConsultacepEvent {
  final String cep;
  SendCepEvent({@required this.cep}) : assert(cep != null);
}
