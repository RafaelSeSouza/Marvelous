/// The types of exception the [NetClient] can raise.
enum NetExceptionType {
  generic,
  invalidCredentials;

  /// Creates the correct type based on the given code.
  factory NetExceptionType.from(
    String code,
  ) {
    switch (code.trim()) {
      case 'InvalidCredentials':
        return NetExceptionType.invalidCredentials;

      default:
        return NetExceptionType.generic;
    }
  }
}

/// Exception raised by the [NetClient] when an error happens.
class NetException implements Exception {
  final NetExceptionType type;
  final String code;
  final String message;

  const NetException({
    this.type = NetExceptionType.generic,
    this.code = '',
    this.message = '',
  });

  /// Creates a new [NetException] from the given code and optional
  /// message.
  ///
  /// This simplifies the creation of a net exception by setting the [type] of
  /// the exception automagically.
  factory NetException.from({
    required String code,
    String message = '',
  }) =>
      NetException(
        type: NetExceptionType.from(code),
        code: code,
        message: message,
      );

  @override
  String toString() {
    return 'NetException{type: $type, code: $code, message: $message}';
  }
}
