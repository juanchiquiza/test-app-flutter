import 'package:dartz/dartz.dart';
import '/movies/domain/entities/movie.dart';
import '/movies/domain/repositories/movies_repository.dart';
import '/movies/infrastructure/data/datasources/movies/movies_data_source.dart';
import '/core/infrastructure/http/exception.dart';
import '/core/shared/constants.dart';
import '/movies/infrastructure/mapper/mapper_domain.dart';
import '/core/domain/failures/common_failure.dart';

/// This is the implementation of our [MoviesRepository]
class MoviesRepositoryImpl implements MoviesRepository {
  /// Constructor
  const MoviesRepositoryImpl(this._moviesDataSource);

  final MoviesDataSource _moviesDataSource;

  @override
  Future<Either<CommonFailure, List<Movie>>> getMovies() async {
    try {
      final result = await _moviesDataSource.getMovies();
      return right(result.map<Movie>((e) => e.toDomain()).toList());
    } on NoInternetConnectionException catch (e) {
      /// returns failure if there was internet connection problem
      return left(CommonFailure.noConnection(message: e.message));
    } on RestApiException catch (e) {
      /// returns failure caused by server exception
      return left(
        CommonFailure.server(
          code: e.errorCode ?? serverErrorCode,
          message: e.errorMessage ?? serverErrorMessage,
        ),
      );
    } on DataException catch (e) {
      /// returns failure if no data is found
      return left(CommonFailure.data(message: e.message));
    }
  }
}
