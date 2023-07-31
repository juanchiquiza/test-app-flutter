import 'package:dartz/dartz.dart';
import '/movies/domain/entities/movie.dart';
import '/core/domain/failures/common_failure.dart';

/// Movies Repository
abstract class MoviesRepository {
  /// This method helps us to obtain a summarized Banners Trade,
  /// in this case we will only obtain their id and their logo
  Future<Either<CommonFailure, List<Movie>>> getMovies();
}
