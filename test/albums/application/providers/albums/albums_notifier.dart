import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_app/movies/application/providers/movies/movies_notifier.dart';
import 'package:test_app/movies/application/providers/movies/movies_state.dart';
import 'package:test_app/movies/domain/entities/movie.dart';
import 'package:test_app/movies/domain/usecases/get_movies_use_case.dart';
import 'package:test_app/core/domain/failures/common_failure.dart';

class MockGetAlbumsUseCase extends Mock implements GetMoviesUseCase {}

void main() {
  late MockGetAlbumsUseCase mockGetAlbumsUseCase;
  late AlbumsNotifier albumsNotifier;

  setUp(() {
    mockGetAlbumsUseCase = MockGetAlbumsUseCase();

    albumsNotifier = AlbumsNotifier(
      mockGetAlbumsUseCase,
    );
  });

  group('Albums notifier', () {
    test(
      '''
      When calling AlbumsNotifier.getAlbums the states are emitted
       loading, data''',
      () async {
        const fakeData = [
          Album(id: 1),
          //  Album(id: 2),
        ];

        /// Arrange
        final tStates = <AlbumsState>[
          const AlbumsState.initial(),
          const AlbumsState.loading(),
          const AlbumsState.data(albums: fakeData)
        ];

        when(() => mockGetAlbumsUseCase.execute())
            .thenAnswer((_) async => right(fakeData));

        final rStates = <AlbumsState>[];

        /// Act
        albumsNotifier.addListener(rStates.add);

        await albumsNotifier.getAlbums();

        /// Assert
        expect(tStates, rStates);
      },
    );

    test(
      '''
      When calling AlbumsNotifier.getAlbums the states are emitted
       loading, error''',
      () async {
        const fakeData = 'error';

        /// Arrange
        final tStates = <AlbumsState>[
          const AlbumsState.initial(),
          const AlbumsState.loading(),
          const AlbumsState.error(
              failure: CommonFailure.data(message: fakeData))
        ];

        when(() => mockGetAlbumsUseCase.execute()).thenAnswer(
            (_) async => left(const CommonFailure.data(message: fakeData)));

        final rStates = <AlbumsState>[];

        /// Act
        albumsNotifier.addListener(rStates.add);

        await albumsNotifier.getAlbums();

        /// Assert
        expect(tStates, rStates);
      },
    );
  });
}
