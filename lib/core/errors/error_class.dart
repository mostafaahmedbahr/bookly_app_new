import 'package:dio/dio.dart';

abstract class Errors {
  final String error;

  Errors({required this.error});
}

class ServerError extends Errors {
  ServerError({required super.error});

  factory ServerError.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError(error: "connectionTimeout");

      case DioExceptionType.sendTimeout:
        return ServerError(error: "sendTimeout");

      case DioExceptionType.receiveTimeout:
        return ServerError(error: "receiveTimeout");

      case DioExceptionType.badCertificate:
        return ServerError(error: "badCertificate");

        // فيها شغل
      case DioExceptionType.badResponse:
        if(dioException.response!.statusCode==404){}
        return ServerError(error: "badResponse");

      case DioExceptionType.cancel:
        return ServerError(error: "cancel");

      case DioExceptionType.connectionError:
        return ServerError(error: "connectionError");

      case DioExceptionType.unknown:
        return ServerError(error: "unknown");
    }
  }
}

class NetworkError extends Errors {
  NetworkError({required super.error});
}

class CachedError extends Errors {
  CachedError({required super.error});
}
