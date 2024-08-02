import 'package:cinemate/core/errors/failure.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/available_seat_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/movie_session_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/payment_intent_input_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/use_cases/get_available_seats_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class TicketPurchaseRepo{
  Future<Either<Failure,List<MovieSessionEntity>>> getMovieSessions(String movieId);
  Future<Either<Failure,List<AvailableSeatEntity>>> getAvailableSeats(GetAvailableSeatsParameters parameters);
  Future<Either<Failure,void>> makePayment({required PaymentIntentInputEntity paymentIntentInputEntity});
  Future<Either<Failure,void>> generateTicket({required String ticketId});
}