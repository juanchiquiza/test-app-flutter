import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/movies/domain/entities/movie.dart';
import 'package:test_app/movies/infrastructure/data/models/movie_dto.dart';
import 'package:test_app/movies/infrastructure/mapper/mapper_domain.dart';

void main() {
  group('MapperMovieDTO', () {
    test('ToDomain should map MovieDTO to Movie', () {
      const MovieDTO movieDTO = MovieDTO(
        id: 1,
        name: 'Test Movie',
      );

      final Movie movie = movieDTO.toDomain();

      expect(movie.id, equals(movieDTO.id));
      expect(movie.name, equals(movieDTO.name));
    });

    test('ToDomain should handle null values', () {
      const MovieDTO movieDTO = MovieDTO(
        id: null,
        name: null,
      );

      final Movie movie = movieDTO.toDomain();

      expect(movie.id, isNull);
      expect(movie.name, isNull);
      expect(movie.thumbnail, isNull);
    });
  });
}
