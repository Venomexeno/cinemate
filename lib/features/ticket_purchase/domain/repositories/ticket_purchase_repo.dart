import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/movie_session_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TicketPurchaseRepo{
  Future<Either<Failure,List<MovieSessionEntity>>> getMovieSessions(String movieId);
}