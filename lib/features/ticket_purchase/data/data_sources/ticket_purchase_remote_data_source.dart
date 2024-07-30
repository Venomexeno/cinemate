import 'package:cinemate/features/ticket_purchase/data/models/available_seat_model.dart';
import 'package:cinemate/features/ticket_purchase/data/models/mvoie_session_model.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/available_seat_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/movie_session_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/use_cases/get_available_seats_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TicketPurchaseRemoteDataSource {
  Future<List<MovieSessionEntity>> getMovieSessions(String movieId);

  Future<List<AvailableSeatEntity>> getAvailableSeats(
      GetAvailableSeatsParameters parameters);
}

class TicketPurchaseRemoteDataSourceImpl
    implements TicketPurchaseRemoteDataSource {
  final FirebaseFirestore _fireStore;

  TicketPurchaseRemoteDataSourceImpl(this._fireStore);

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
}
