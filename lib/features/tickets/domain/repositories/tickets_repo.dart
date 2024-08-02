import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/features/tickets/domain/entities/ticket_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TicketsRepo{
  Future<Either<Failure,List<TicketEntity>>> getTickets();
}