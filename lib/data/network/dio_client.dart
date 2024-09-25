import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  Dio get dio {
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.contentType = Headers.jsonContentType;
    _dio.options.responseType = ResponseType.plain;

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      )
    );
    return _dio;
  }
}
