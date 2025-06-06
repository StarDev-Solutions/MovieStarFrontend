import 'dart:io';

import 'package:dio/dio.dart';
import 'package:moviestar/src/base/domain/entities/enums/error_messages.dart';
import 'package:moviestar/src/base/domain/entities/enums/module_type.dart';
import 'package:moviestar/src/core/errors/failure.dart';

abstract class BaseRepository {
  BaseRepository();

  final String _baseAddress = 'https://media-app-url.com/api/v1/';

  void configureDio(Dio dio, {int timeoutSeconds = 10}) {
    dio.options = BaseOptions(
      connectTimeout: Duration(seconds: timeoutSeconds),
      sendTimeout: Duration(seconds: timeoutSeconds),
      receiveTimeout: Duration(seconds: timeoutSeconds),
      headers: {'Content-Type': 'application/json'},
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) => _requestInterceptor(
          options.copyWith(
            connectTimeout: Duration(seconds: timeoutSeconds),
            sendTimeout: Duration(seconds: timeoutSeconds),
            receiveTimeout: Duration(seconds: timeoutSeconds),
          ),
          handler,
        ),
        onError: (DioException error, ErrorInterceptorHandler handler) => _errorInterceptor(dio, error, handler),
      ),
    );
  }

  dynamic _requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
    //TODO - IMPLEMENTAR
    return handler.next(options);
  }

  dynamic _errorInterceptor(Dio dio, DioException error, ErrorInterceptorHandler handler) async {
    //TODO - IMPLEMENTAR
    return handler.next(error);
  }

  ///Gera link do método
  String gerarURL({String method = '', ModuleType moduleType = ModuleType.authentication}) {
    return _baseAddress + _getModule(moduleType) + method;
  }

  ///Método que retorna o módulo da API onde será realizada a requisição
  ///* `type` - Módulo da API
  String _getModule(ModuleType type) {
    switch (type) {
      case ModuleType.blog:
        return 'application/';
      case ModuleType.authentication:
        return 'authentication/';
      case ModuleType.media:
        return 'price/';
    }
  }

  Failure checkError(error) {
    if (error.error is SocketException) {
      return Failure(connectionError: true, message: ErrorMessages.server.message);
    } else if (error.type == DioExceptionType.connectionTimeout) {
      return Failure(message: ErrorMessages.timeout.message, statusCode: 500);
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return Failure(message: ErrorMessages.timeout.message, statusCode: 500);
    } else if (error.type == DioExceptionType.sendTimeout) {
      return Failure(message: ErrorMessages.timeout.message, statusCode: 500);
    } else if (error.type == DioExceptionType.connectionError) {
      return Failure(connectionError: true, message: ErrorMessages.generic.message);
    } else if (error.type == DioExceptionType.badResponse && error.response != null && error.response!.statusCode == 404 ||  error.response!.statusCode  == 503) {
      return Failure(message: ErrorMessages.unavailable.message, statusCode: 404);
    } else if (error is DioException && error.response != null && error.response!.data.isNotEmpty) {
      //TODO - IMPLEMENTAR
    } 

    return Failure(message: ErrorMessages.unknown.message);
  }
}