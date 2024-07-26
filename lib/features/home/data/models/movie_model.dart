import 'package:cinemate/features/home/domain/entities/movie_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory MovieModel.fromDocument(DocumentSnapshot doc) {
    return MovieModel(
      id: doc.id,
      name: doc['name'],
      imageUrl: doc['imageUrl'],
    );
  }
}
