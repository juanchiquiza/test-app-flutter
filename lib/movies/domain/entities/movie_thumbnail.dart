import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_thumbnail.freezed.dart';

/// Represents a Banners Trade For You
@freezed
class MovieThumbnail with _$MovieThumbnail {
  /// Empty constructor
  const MovieThumbnail._();

  /// Named constructor of Promotion For You properties
  const factory MovieThumbnail({
    /// Path of movie
    String? path,

    /// Extension of movie
    String? extension,
  }) = _MovieThumbnail;
}
