import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/movies/domain/usecases/get_movies_use_case.dart';
import '/movies/application/providers/movies/movies_state.dart';

///Movies Notifier
class MoviesNotifier extends StateNotifier<MoviesState> {
  ///Constructor
  MoviesNotifier(this._getMoviesUseCase) : super(const MoviesState.initial());

  ///Movies Use case instance
  final GetMoviesUseCase _getMoviesUseCase;

  ///Get Movies
  Future<void> getMovies() async {
    state = const MoviesState.loading();

    final result = await _getMoviesUseCase.execute();

    state = result.fold(
      (failure) => MoviesState.error(failure: failure),
      (response) => MoviesState.data(
        movie: response,
      ),
    );
  }
}
