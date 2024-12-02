class AppException implements Exception {
  final String? message;
  final StackTrace? stackTrace;

  const AppException({this.message, this.stackTrace});
}

class ServerException extends AppException {
  // ServerException({String? message, StackTrace? stackTrace}): super(message: message, stackTrace: stackTrace);
  ServerException({super.message, super.stackTrace});
}

class CacheException extends AppException {
  CacheException({super.message, super.stackTrace});
}
