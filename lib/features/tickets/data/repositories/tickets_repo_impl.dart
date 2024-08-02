import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/features/tickets/data/data_sources/tickets_remote_data_source.dart';
import 'package:cinemate/features/tickets/domain/entities/ticket_entity.dart';
import 'package:cinemate/features/tickets/domain/repositories/tickets_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class TicketsRepoImpl implements TicketsRepo {
  final TicketsRemoteDataSource _ticketsRemoteDataSource;

  TicketsRepoImpl(this._ticketsRemoteDataSource);

  @override
  Future<Either<Failure, List<TicketEntity>>> getTickets() async {
    try {
      final tickets = await _ticketsRemoteDataSource.getTickets();
      return Right(tickets);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure(e.code));
      }
      return Left(Failure(e.toString()));
    }
  }
}
