import 'package:cinemate/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.id,
    required super.company,
    required super.coverUrl,
    required super.name,
    required super.posterUrl,
    required super.subject,
    required super.movieImages,
    required super.rating,
    required super.imbdRating,
  });

  factory MovieDetailsModel.fromDocument(DocumentSnapshot doc) {
    return MovieDetailsModel(
      id: doc.id,
      company: doc['company'],
      coverUrl: doc['coverUrl'],
      name: doc['name'],
      posterUrl: doc['posterUrl'],
      subject: doc['subject'],
      movieImages: List<String>.from(doc['movieImages']),
      rating: doc['rating'],
      imbdRating: doc['imdbRating'],
    );
  }
}
