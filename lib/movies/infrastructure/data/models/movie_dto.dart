import 'package:freezed_annotation/freezed_annotation.dart';
import '/movies/infrastructure/data/models/movie_thumbnail_dto.dart';

part 'movie_dto.freezed.dart';

part 'movie_dto.g.dart';

/// Represents a MovieDTO
@freezed
class MovieDTO with _$MovieDTO {
  /// Empty constructor
  const MovieDTO._();

  /// Named constructor with the properties returned
  const factory MovieDTO({

    /// Id of Movie
    int? id,

    /// title of the Movie
    String? name,

    /// Thumbnail of Movie
    MovieThumbnailDTO? thumbnail,
  }) = _MovieDTO;

  /// Connect the generated [_$MovieDTOFromJson]
  /// function to the `fromJson` factory.
  factory MovieDTO.fromJson(Map<String, dynamic> json) =>
      _$MovieDTOFromJson(json);
}
