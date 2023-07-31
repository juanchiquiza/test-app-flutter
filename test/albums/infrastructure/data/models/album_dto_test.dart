import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/albums/infrastructure/data/models/album_dto.dart';

void main() {
  group('AlbumDTO', () {
    test('FromJson should create an AlbumDTO from JSON', () {
      final json = {
        'albumId': 1,
        'id': 1,
        'title': 'Test Album',
        'url': 'https://example.com/album.jpg',
        'thumbnailUrl': 'https://example.com/album_thumb.jpg'
      };
      final album = AlbumDTO.fromJson(json);

      expect(album.albumId, equals(1));
      expect(album.id, equals(1));
      expect(album.title, equals('Test Album'));
      expect(album.url, equals('https://example.com/album.jpg'));
      expect(album.thumbnailUrl, equals('https://example.com/album_thumb.jpg'));
    });

    test('FromJson should handle null values', () {
      final json = {
        'albumId': null,
        'id': 10,
        'title': null,
        'url': null,
        'thumbnailUrl': null,
      };
      final album = AlbumDTO.fromJson(json);

      expect(album.id, 10);
      expect(album.albumId, isNull);
      expect(album.title, isNull);
      expect(album.url, isNull);
      expect(album.thumbnailUrl, isNull);
    });
  });
}
