import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/movies/application/providers/movies/movies_notifier.dart';
import '/movies/application/providers/movies/movies_state.dart';
import '/movies/domain/repositories/movies_repository.dart';
import '/movies/domain/usecases/get_movies_use_case.dart';
import '/movies/infrastructure/data/datasources/movies/movies_data_source.dart';
import '/movies/infrastructure/data/repositories/movies_repository_impl.dart';
import '/core/shared/providers.dart';

/// Movies Data Source provider
final moviesDataSourceProvider = Provider<MoviesDataSource>(
  (ref) => MoviesDataSourceImpl(
    ref.watch(dioProvider),
  ),
);

/// Movies Repository provider
final moviesRepositoryProvider = Provider<MoviesRepository>(
  (ref) => MoviesRepositoryImpl(
    ref.watch(
      moviesDataSourceProvider,
    ),
  ),
);

/// Get Movies Use case provider
final getMoviesUseCaseProvider = Provider<GetMoviesUseCase>(
  (ref) => GetMoviesUseCase(
    ref.watch(moviesRepositoryProvider),
  ),
);

/// Notifier provider for Movies
final moviesNotifierProvider =
    StateNotifierProvider<MoviesNotifier, MoviesState>(
  (ref) => MoviesNotifier(
    ref.watch(getMoviesUseCaseProvider),
  ),
);
