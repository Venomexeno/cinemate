import 'package:cinemate/features/ticket_purchase/domain/entities/movie_session_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MovieSessionModel extends MovieSessionEntity {
  const MovieSessionModel({
    required super.id,
    required super.date,
  });

  factory MovieSessionModel.fromDocument(DocumentSnapshot doc) {
    return MovieSessionModel(
      id: doc.id,
      date: doc['date'],
    );
  }
}
