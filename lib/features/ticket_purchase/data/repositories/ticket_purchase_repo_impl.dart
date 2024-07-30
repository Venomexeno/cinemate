import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/features/ticket_purchase/data/data_sources/ticket_purchase_remote_data_source.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/movie_session_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/repositories/ticket_purchase_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

class TicketPurchaseRepoImpl implements TicketPurchaseRepo {
  final TicketPurchaseRemoteDataSource _ticketPurchaseRemoteDataSource;

  TicketPurchaseRepoImpl(this._ticketPurchaseRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieSessionEntity>>> getMovieSessions(
      String movieId) async {
    try {
      final movieSessions =
          await _ticketPurchaseRemoteDataSource.getMovieSessions(movieId);
      return Right(movieSessions);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure(e.code));
      }
      return Left(Failure(e.toString()));
    }
  }
}