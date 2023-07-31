import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/albums/infrastructure/data/models/album_dto.dart';
import 'package:test_app/albums/domain/entities/album.dart';
import 'package:test_app/albums/infrastructure/mapper/mapper_domain.dart';

void main() {
  group('MapperAlbumDTO', () {
    test('ToDomain should map AlbumDTO to Album', () {
      const AlbumDTO albumDTO = AlbumDTO(
        albumId: 1,
        id: 1,
        title: 'Test Album',
        url: 'https://example.com/album.jpg',
        thumbnailUrl: 'https://example.com/album_thumb.jpg',
      );

      final Album album = albumDTO.toDomain();

      expect(album.albumId, equals(albumDTO.albumId));
      expect(album.id, equals(albumDTO.id));
      expect(album.title, equals(albumDTO.title));
      expect(album.url, equals(albumDTO.url));
      expect(album.thumbnailUrl, equals(albumDTO.thumbnailUrl));
    });

    test('ToDomain should handle null values', () {
      const AlbumDTO albumDTO = AlbumDTO(
        albumId: null,
        id: null,
        title: null,
        url: null,
        thumbnailUrl: null,
      );

      final Album album = albumDTO.toDomain();

      expect(album.albumId, isNull);
      expect(album.id, isNull);
      expect(album.title, isNull);
      expect(album.url, isNull);
      expect(album.thumbnailUrl, isNull);
    });
  });
}
