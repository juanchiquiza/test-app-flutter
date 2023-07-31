import 'package:freezed_annotation/freezed_annotation.dart';
import '/movies/domain/entities/movie_thumbnail.dart';

part 'movie.freezed.dart';

/// Represents a Banners Trade For You
@freezed
class Movie with _$Movie {
  /// Empty constructor
  const Movie._();

  /// Named constructor of Promotion For You properties
  const factory Movie({
    /// Id of Movie
    int? id,

    /// title of the Movie
    String? name,

    /// Type of the navigation of Promotion
    MovieThumbnail? thumbnail,
  }) = _Movie;
}
