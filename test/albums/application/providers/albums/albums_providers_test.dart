import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/albums/application/providers/albums/albums_providers.dart';
import 'package:test_app/albums/domain/usecases/get_albums_use_case.dart';
import 'package:test_app/albums/infrastructure/data/datasources/albums/albums_data_source.dart';
import 'package:test_app/albums/infrastructure/data/repositories/albums_repository_impl.dart';

void main() {
  group('AlbumsNotifier', () {
    test('AlbumsDataSourceProvider returns an instance of AlbumsDataSourceImpl',
        () {
      final container = ProviderContainer();
      final albumsDataSource = container.read(albumsDataSourceProvider);
      expect(albumsDataSource, isA<AlbumsDataSourceImpl>());
    });
    test('AlbumsRepositoryProvider returns an instance of AlbumsRepositoryImpl',
        () {
      final container = ProviderContainer();
      final albumsRepository = container.read(albumsRepositoryProvider);
      expect(albumsRepository, isA<AlbumsRepositoryImpl>());
    });
    test('GetAlbumsUseCaseProvider returns an instance of GetAlbumsUseCase',
        () {
      final container = ProviderContainer();
      final getAlbumsUseCase = container.read(getAlbumsUseCaseProvider);
      expect(getAlbumsUseCase, isA<GetMoviesUseCase>());
    });
  });
}
