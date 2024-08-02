import 'package:cinemate/features/tickets/data/models/ticket_model.dart';
import 'package:cinemate/features/tickets/domain/entities/ticket_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class TicketsRemoteDataSource {
  Future<List<TicketEntity>> getTickets();
}

class TicketsRemoteDataSourceImpl implements TicketsRemoteDataSource {
  final FirebaseFirestore _fireStore;
  final FirebaseAuth _auth;

  TicketsRemoteDataSourceImpl(this._fireStore, this._auth);

  @override
  Future<List<TicketEntity>> getTickets() async {
    final currentUserId = _getCurrentUserId();
    final snapShot = await _fireStore
        .collection('tickets')
        .doc(currentUserId)
        .collection('movie_tickets')
        .get();

    final tickets =
        snapShot.docs.map((doc) => TicketModel.fromDocument(doc)).toList();

    return tickets;
  }

  String _getCurrentUserId() => _auth.currentUser!.uid;
}
