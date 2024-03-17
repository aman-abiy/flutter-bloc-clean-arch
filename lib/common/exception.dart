class ServerException implements Exception {

  ServerException(this.message);
  final String message;
}

class DatabaseException implements Exception {

  DatabaseException(this.message);
  final String message;
}

class CacheException implements Exception {

  CacheException(this.message);
  final String message;
}

class NoConnectionException implements Exception {

  NoConnectionException(this.message);
  final String message;
}

class UnauthorizedException implements Exception {

  UnauthorizedException(this.message);
  final String message;
}

class TimeoutException implements Exception {

  TimeoutException(this.message);
  final String message;
}
