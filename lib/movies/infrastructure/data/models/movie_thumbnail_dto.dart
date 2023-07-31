import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_thumbnail_dto.freezed.dart';

part 'movie_thumbnail_dto.g.dart';

/// Represents a MovieDTO
@freezed
class MovieThumbnailDTO with _$MovieThumbnailDTO {
  /// Empty constructor
  const MovieThumbnailDTO._();

  /// Named constructor with the properties returned
  const factory MovieThumbnailDTO({
    /// Path of movie
    String? path,

    /// Extension of movie
    String? extension,
  }) = _MovieThumbnailDTO;

  /// Connect the generated [_$MovieThumbnailDTOFromJson]
  /// function to the `fromJson` factory.
  factory MovieThumbnailDTO.fromJson(Map<String, dynamic> json) =>
      _$MovieThumbnailDTOFromJson(json);
}
