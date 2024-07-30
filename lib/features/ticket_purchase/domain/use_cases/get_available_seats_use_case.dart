import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/core/use_cases/use_case.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/available_seat_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/repositories/ticket_purchase_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetAvailableSeatsUseCase
    extends UseCase<List<AvailableSeatEntity>, GetAvailableSeatsParameters> {
  final TicketPurchaseRepo _ticketPurchaseRepo;

  GetAvailableSeatsUseCase(this._ticketPurchaseRepo);

  @override
  Future<Either<Failure, List<AvailableSeatEntity>>> call(
      GetAvailableSeatsParameters parameters) async {
    return _ticketPurchaseRepo.getAvailableSeats(parameters);
  }
}

class GetAvailableSeatsParameters extends Equatable {
  final String movieSessionId;
  final String movieId;

  const GetAvailableSeatsParameters({
    required this.movieSessionId,
    required this.movieId,
  });

  @override
  List<Object> get props => [
        movieSessionId,
        movieId,
      ];
}
