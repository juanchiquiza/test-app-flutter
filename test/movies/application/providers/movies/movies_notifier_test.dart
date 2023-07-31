import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_app/movies/application/providers/movies/movies_notifier.dart';
import 'package:test_app/movies/application/providers/movies/movies_state.dart';
import 'package:test_app/movies/domain/entities/movie.dart';
import 'package:test_app/movies/domain/usecases/get_movies_use_case.dart';
import 'package:test_app/core/domain/failures/common_failure.dart';

class MockGetMoviesUseCase extends Mock implements GetMoviesUseCase {}

void main() {
  late MockGetMoviesUseCase mockGetMoviesUseCase;
  late MoviesNotifier moviesNotifier;

  setUp(() {
    mockGetMoviesUseCase = MockGetMoviesUseCase();

    moviesNotifier = MoviesNotifier(
      mockGetMoviesUseCase,
    );
  });

  group('Movies notifier', () {
    test(
      '''
      When calling MoviesNotifier.getMovies the states are emitted
       loading, data''',
      () async {
        const fakeData = [
          Movie(id: 1),
        ];

        /// Arrange
        final tStates = <MoviesState>[
          const MoviesState.initial(),
          const MoviesState.loading(),
          const MoviesState.data(movie: fakeData)
        ];

        when(() => mockGetMoviesUseCase.execute())
            .thenAnswer((_) async => right(fakeData));

        final rStates = <MoviesState>[];

        /// Act
        moviesNotifier.addListener(rStates.add);

        await moviesNotifier.getMovies();

        /// Assert
        expect(tStates, rStates);
      },
    );

    test(
      '''
      When calling MoviesNotifier.getMovies the states are emitted
       loading, error''',
      () async {
        const fakeData = 'error';

        /// Arrange
        final tStates = <MoviesState>[
          const MoviesState.initial(),
          const MoviesState.loading(),
          const MoviesState.error(
              failure: CommonFailure.data(message: fakeData))
        ];

        when(() => mockGetMoviesUseCase.execute()).thenAnswer(
            (_) async => left(const CommonFailure.data(message: fakeData)));

        final rStates = <MoviesState>[];

        /// Act
        moviesNotifier.addListener(rStates.add);

        await moviesNotifier.getMovies();

        /// Assert
        expect(tStates, rStates);
      },
    );
  });
}
