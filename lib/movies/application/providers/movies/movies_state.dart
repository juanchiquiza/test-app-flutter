import 'package:freezed_annotation/freezed_annotation.dart';
import '/movies/domain/entities/movie.dart';
import '/core/domain/failures/common_failure.dart';

part 'movies_state.freezed.dart';

/// States for the Banners Trade
@freezed
class MoviesState with _$MoviesState {
  const MoviesState._();

  ///Initial: state of Banners Trade is empty
  const factory MoviesState.initial() = _MoviesStateInitial;

  ///Loading: state of Banners Trade while waiting for information
  const factory MoviesState.loading() = _MoviesStateLoading;

  ///Data: state of Banners Trade when the information arrives
  const factory MoviesState.data({
    required List<Movie> movie,
  }) = _MoviesStateData;

  ///Error with a failure instance
  const factory MoviesState.error({
    required CommonFailure failure,
  }) = _Error;
}
