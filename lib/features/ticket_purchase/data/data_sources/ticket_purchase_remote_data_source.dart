import 'package:cinemate/features/ticket_purchase/data/models/mvoie_session_model.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/movie_session_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TicketPurchaseRemoteDataSource {
  Future<List<MovieSessionEntity>> getMovieSessions(String movieId);
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
        .collection('showTimes').where('available', isEqualTo: true)
        .get();
    return snapshot.docs
        .map((doc) => MovieSessionModel.fromDocument(doc))
        .toList();
  }
}
