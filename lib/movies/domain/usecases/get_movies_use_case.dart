import 'package:dartz/dartz.dart';
import '/movies/domain/repositories/movies_repository.dart';
import '/movies/domain/entities/movie.dart';
import '/core/domain/usecase/base/use_case.dart';
import '/core/domain/failures/common_failure.dart';

/// Through this use case we will obtain the Movies list
class GetMoviesUseCase extends UseCase<CommonFailure, List<Movie>> {
  /// Constructor
  GetMoviesUseCase(
    this._moviesRepository,
  );

  final MoviesRepository _moviesRepository;

  /// Execution
  @override
  Future<Either<CommonFailure, List<Movie>>> execute() async {
    return _moviesRepository.getMovies();
  }
}
