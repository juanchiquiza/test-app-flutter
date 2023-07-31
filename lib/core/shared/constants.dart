/// Environment constant values
enum EnvironmentConstants {
  /// Value for 'dev'
  development('gateway.marvel.com');

  /// Constructor
  const EnvironmentConstants(this.value);

  /// Represents the value of each enum
  final String value;
}

/// Server error mesage
const serverErrorMessage =
'''¡Lo sentimos! Ha ocurrido un problema con el servidor. Por favor intenta más tarde''';

/// Server error code
const serverErrorCode = 500;