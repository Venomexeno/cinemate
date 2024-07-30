import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/core/use_cases/use_case.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/movie_session_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/repositories/ticket_purchase_repo.dart';
import 'package:dartz/dartz.dart';

class GetMovieSessionsUseCase
    extends UseCase<List<MovieSessionEntity>, String> {
  final TicketPurchaseRepo _ticketPurchaseRepo;

  GetMovieSessionsUseCase(this._ticketPurchaseRepo);

  @override
  Future<Either<Failure, List<MovieSessionEntity>>> call(
      String parameters) async {
    return await _ticketPurchaseRepo.getMovieSessions(parameters);
  }
}
