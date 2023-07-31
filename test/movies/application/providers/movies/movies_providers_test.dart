import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/movies/application/providers/movies/movies_providers.dart';
import 'package:test_app/movies/domain/usecases/get_movies_use_case.dart';
import 'package:test_app/movies/infrastructure/data/datasources/movies/movies_data_source.dart';
import 'package:test_app/movies/infrastructure/data/repositories/movies_repository_impl.dart';

void main() {
  group('MoviesNotifier', () {
    test('MoviesDataSourceProvider returns an instance of MoviesDataSourceImpl',
        () {
      final container = ProviderContainer();
      final moviesDataSource = container.read(moviesDataSourceProvider);
      expect(moviesDataSource, isA<MoviesDataSourceImpl>());
    });
    test('MoviesRepositoryProvider returns an instance of MoviesRepositoryImpl',
        () {
      final container = ProviderContainer();
      final moviesRepository = container.read(moviesRepositoryProvider);
      expect(moviesRepository, isA<MoviesRepositoryImpl>());
    });
    test('GetMoviesUseCaseProvider returns an instance of GetMoviesUseCase',
        () {
      final container = ProviderContainer();
      final getMoviesUseCase = container.read(getMoviesUseCaseProvider);
      expect(getMoviesUseCase, isA<GetMoviesUseCase>());
    });
  });
}
