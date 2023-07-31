import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/movies/infrastructure/data/models/movie_dto.dart';

void main() {
  group('MovieDTO', () {
    test('FromJson should create an MovieDTO from JSON', () {
      final json = {
        'id': 1,
        'name': 'Test Movie',
      };
      final movie = MovieDTO.fromJson(json);

      expect(movie.id, equals(1));
      expect(movie.name, equals('Test Movie'));
    });

    test('FromJson should handle null values', () {
      final json = {
        'id': 10,
        'name': 'Test Movie',
      };
      final movie = MovieDTO.fromJson(json);

      expect(movie.id, 10);
      expect(movie.name, 'Test Movie');
      expect(movie.thumbnail, isNull);
    });
  });
}
