import 'package:cinemate/features/home/data/models/movie_model.dart';
import 'package:cinemate/features/home/domain/entities/movie_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieEntity>> getHighlightedMovies();

  Future<List<MovieEntity>> getMoviesInTheaters();

  Future<List<MovieEntity>> getComingSoonMovies();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore _fireStore;

  HomeRemoteDataSourceImpl(this._fireStore);

  @override
  Future<List<MovieEntity>> getHighlightedMovies() async {
    final snapshot = await _fireStore.collection('highlight_movies').get();
    return snapshot.docs.map((doc) {
      return MovieModel.fromDocument(doc);
    }).toList();
  }

  @override
  Future<List<MovieEntity>> getMoviesInTheaters() async {
    final snapshot = await _fireStore.collection('movies_in_theaters').get();
    return snapshot.docs.map((doc) {
      return MovieModel.fromDocument(doc);
    }).toList();
  }

  @override
  Future<List<MovieEntity>> getComingSoonMovies() async {
    final snapshot = await _fireStore.collection('coming_soon_movies').get();
    return snapshot.docs.map((doc) {
      return MovieModel.fromDocument(doc);
    }).toList();
  }
}
