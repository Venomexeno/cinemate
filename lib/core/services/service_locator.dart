import 'package:cinemate/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:cinemate/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:cinemate/features/auth/domain/repositories/auth_repo.dart';
import 'package:cinemate/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:cinemate/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:cinemate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:cinemate/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:cinemate/features/home/data/repositories/home_repo_impl.dart';
import 'package:cinemate/features/home/domain/repositories/home_repo.dart';
import 'package:cinemate/features/home/domain/use_cases/get_coming_soon_movies_use_case.dart';
import 'package:cinemate/features/home/domain/use_cases/get_highlighted_movies_use_case.dart';
import 'package:cinemate/features/home/domain/use_cases/get_movies_in_theaters_use_case.dart';
import 'package:cinemate/features/home/presentation/manager/get_coming_soon_movies_cubit/get_coming_soon_movies_cubit.dart';
import 'package:cinemate/features/home/presentation/manager/get_highlight_movies_cubit/get_highlight_movies_cubit.dart';
import 'package:cinemate/features/home/presentation/manager/get_movies_in_theaters_cubit/get_movies_in_theaters_cubit.dart';
import 'package:cinemate/features/movie_details/data/data_sources/movie_details_remote_data_source.dart';
import 'package:cinemate/features/movie_details/data/repositories/movie_details_repo_impl.dart';
import 'package:cinemate/features/movie_details/domain/repositories/movie_details_repo.dart';
import 'package:cinemate/features/movie_details/domain/use_cases/get_movie_details_use_case.dart';
import 'package:cinemate/features/movie_details/presentation/manager/get_movie_details_cubit/get_movie_details_cubit.dart';
import 'package:cinemate/features/root/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    ///Cubit
    //Auth Cubits
    sl.registerFactory<AuthCubit>(() => AuthCubit(
          sl.call(),
          sl.call(),
        ));
    //Root Cubits
    sl.registerFactory<BottomNavCubit>(() => BottomNavCubit());

    //Home Cubits
    sl.registerFactory<GetHighlightMoviesCubit>(() => GetHighlightMoviesCubit(sl.call()));
    sl.registerFactory<GetMoviesInTheatersCubit>(() => GetMoviesInTheatersCubit(sl.call()));
    sl.registerFactory<GetComingSoonMoviesCubit>(() => GetComingSoonMoviesCubit(sl.call()));

    //Movie Details Cubits
    sl.registerFactory<GetMovieDetailsCubit>(() => GetMovieDetailsCubit(sl.call()));

    //-------------------------------------------------------------------------------------------------//
    ///UseCase
    //Auth Use Cases
    sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase(sl.call()));
    sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(sl.call()));

    //Home Use Cases
    sl.registerLazySingleton<GetHighlightedMoviesUseCase>(() => GetHighlightedMoviesUseCase(sl.call()));
    sl.registerLazySingleton<GetMoviesInTheatersUseCase>(() => GetMoviesInTheatersUseCase(sl.call()));
    sl.registerLazySingleton<GetComingSoonMoviesUseCase>(() => GetComingSoonMoviesUseCase(sl.call()));

    //Movie Details Use Cases
    sl.registerLazySingleton<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(sl.call()));
    //-------------------------------------------------------------------------------------------------//
    ///Repository
    //Auth Repository
    sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl.call()));

    //Home Repository
    sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl.call()));

    //Movie Details Repository
    sl.registerLazySingleton<MovieDetailsRepo>(() => MovieDetailsRepoImpl(sl.call()));
    //-------------------------------------------------------------------------------------------------//
    ///DataSource
    ///Remote Data Sources
    //Auth DataSource
    sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(sl.call()));

    //Home DataSource
    sl.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(sl.call()));

    //Movie Details DataSource
    sl.registerLazySingleton<MovieDetailsRemoteDataSource>(
        () => MovieDetailsRemoteDataSourceImpl(sl.call()));

    //-------------------------------------------------------------------------------------------------//
    ///Shared Preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => prefs);
    //-------------------------------------------------------------------------------------------------//
    ///Secure Storage
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    sl.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);

    //-------------------------------------------------------------------------------------------------//
    /// Initialize Firebase
    await Firebase.initializeApp();
    //-------------------------------------------------------------------------------------------------//
    /// Register FirebaseAuth
    sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    //-------------------------------------------------------------------------------------------------//
    /// Register Firebase FireStore
    sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  }
}
