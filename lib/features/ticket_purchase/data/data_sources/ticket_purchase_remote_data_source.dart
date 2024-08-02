import 'package:cinemate/core/services/stripe_service.dart';
import 'package:cinemate/features/ticket_purchase/data/models/available_seat_model.dart';
import 'package:cinemate/features/ticket_purchase/data/models/mvoie_session_model.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/available_seat_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/movie_session_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/payment_intent_input_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/use_cases/get_available_seats_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class TicketPurchaseRemoteDataSource {
  Future<List<MovieSessionEntity>> getMovieSessions(String movieId);

  Future<List<AvailableSeatEntity>> getAvailableSeats(
      GetAvailableSeatsParameters parameters);

  Future<void> makePayment({
    required PaymentIntentInputEntity paymentIntentInputEntity,
  });

  Future<void> generateTicket({required String ticketId});
}

class TicketPurchaseRemoteDataSourceImpl
    implements TicketPurchaseRemoteDataSource {
  final FirebaseFirestore _fireStore;
  final StripeService _stripeService;
  final FirebaseAuth _firebaseAuth;

  TicketPurchaseRemoteDataSourceImpl(
      this._fireStore, this._stripeService, this._firebaseAuth);

  @override
  Future<List<MovieSessionEntity>> getMovieSessions(String movieId) async {
    final snapshot = await _fireStore
        .collection('movie_sessions')
        .doc(movieId)
        .collection('showTimes')
        .where('available', isEqualTo: true)
        .get();
    return snapshot.docs
        .map((doc) => MovieSessionModel.fromDocument(doc))
        .toList();
  }

  @override
  Future<List<AvailableSeatEntity>> getAvailableSeats(
      GetAvailableSeatsParameters parameters) async {
    final snapShot = await _fireStore
        .collection('movie_available_seats')
        .doc(parameters.movieId)
        .collection(parameters.movieSessionId)
        .get();
    return snapShot.docs
        .map((doc) => AvailableSeatModel.fromDocument(doc))
        .toList();
  }

  @override
  Future<void> makePayment(
      {required PaymentIntentInputEntity paymentIntentInputEntity}) async {
    await _stripeService.makePayment(
      paymentIntentInputEntity: paymentIntentInputEntity,
    );
  }

  @override
  Future<void> generateTicket({required String ticketId}) async {
    final userId =  _getCurrentUserId();

    await _fireStore.collection('tickets').doc(userId).collection('movie_tickets').doc(ticketId).set({
      'created_at': FieldValue.serverTimestamp(),
    });
  }

  String _getCurrentUserId ()  => _firebaseAuth.currentUser!.uid;
}
