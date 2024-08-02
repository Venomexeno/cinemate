part of 'generate_ticket_cubit.dart';

sealed class GenerateTicketState extends Equatable {
  const GenerateTicketState();

  @override
  List<Object> get props => [];
}

final class GenerateTicketInitial extends GenerateTicketState {}

final class GenerateTicketLoading extends GenerateTicketState {}

final class GenerateTicketSuccess extends GenerateTicketState {}

final class GenerateTicketFailure extends GenerateTicketState {
  final String errMessage;

  const GenerateTicketFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}