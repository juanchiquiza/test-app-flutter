import '/movies/domain/entities/movie_thumbnail.dart';
import '/movies/infrastructure/data/models/movie_thumbnail_dto.dart';
import '/movies/domain/entities/movie.dart';
import '/movies/infrastructure/data/models/movie_dto.dart';

/// With this mapper, we can convert a Data Transfer Object to an Entity
extension MapperMovieDTO on MovieDTO {
  /// [MovieDTO] (Infrastructure) to [Movie] (Domain)
  Movie toDomain() => Movie(
        id: id,
        name: name,
        thumbnail: thumbnail?.toDomain(),
      );
}

/// With this mapper, we can convert a Data Transfer Object to an Entity
extension MapperThumbnailDTO on MovieThumbnailDTO {
  /// [MovieDTO] (Infrastructure) to [Movie] (Domain)
  MovieThumbnail toDomain() => MovieThumbnail(
        extension: extension,
        path: path,
      );
}
