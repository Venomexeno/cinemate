import 'package:cinemate/features/movie_details/data/models/movie_details_model.dart';
import 'package:cinemate/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsEntity> getMovieDetails(String movieId);
}

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final FirebaseFirestore _fireStore;

  MovieDetailsRemoteDataSourceImpl(this._fireStore);

  @override
  Future<MovieDetailsEntity> getMovieDetails(String movieId) async {
    final doc = await _fireStore.collection('movies_details').doc(movieId).get();
    return MovieDetailsModel.fromDocument(doc);
  }
}
