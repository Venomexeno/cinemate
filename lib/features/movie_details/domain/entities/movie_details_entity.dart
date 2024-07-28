import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable {
  final String id;
  final String company;
  final String coverUrl;
  final String name;
  final String posterUrl;
  final String subject;
  final List<String> movieImages;
  final num rating;
  final num imbdRating;

  const MovieDetailsEntity({
    required this.id,
    required this.company,
    required this.coverUrl,
    required this.name,
    required this.posterUrl,
    required this.subject,
    required this.movieImages,
    required this.rating,
    required this.imbdRating,
  });

  @override
  List<Object> get props => [
        id,
        company,
        coverUrl,
        name,
        posterUrl,
        subject,
        movieImages,
        rating,
        imbdRating
      ];
}
