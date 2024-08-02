part of 'get_tickets_cubit.dart';

sealed class GetTicketsState extends Equatable {
  const GetTicketsState();

  @override
  List<Object> get props => [];
}

final class GetTicketsInitial extends GetTicketsState {}

final class GetTicketsLoading extends GetTicketsState {}

final class GetTicketsSuccess extends GetTicketsState {
  final List<TicketEntity> tickets;

  const GetTicketsSuccess({required this.tickets});

  @override
  List<Object> get props => [tickets];
}

final class GetTicketsFailure extends GetTicketsState {
  final String errMessage;

  const GetTicketsFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
