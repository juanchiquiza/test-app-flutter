/// Enum with the constant values of the Movies data layer
enum MoviesDataConst {
  /// EndPoint to obtain the information of Movies
  movieDataConstEndPoint('/v1/public/characters');

  /// Constructor
  const MoviesDataConst(this.value);

  /// Represents the value of each enum
  final String value;
}
