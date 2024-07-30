part of 'get_available_seats_cubit.dart';

sealed class GetAvailableSeatsState extends Equatable {
  const GetAvailableSeatsState();

  @override
  List<Object> get props => [];
}

final class GetAvailableSeatsInitial extends GetAvailableSeatsState {}

final class GetAvailableSeatsLoading extends GetAvailableSeatsState {}

final class GetAvailableSeatsSuccess extends GetAvailableSeatsState {
  final List<AvailableSeatEntity> availableSeats;

  const GetAvailableSeatsSuccess({required this.availableSeats});

  @override
  List<Object> get props => [availableSeats];
}

final class GetAvailableSeatsFailure extends GetAvailableSeatsState {
  final String errMessage;

  const GetAvailableSeatsFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
