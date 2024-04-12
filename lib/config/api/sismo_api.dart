import 'package:dio/dio.dart';

class SismoApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    //base url
    _dio.options.baseUrl = 'localhost:9090/api';
  }

  static Future httpGet(String path, [queryParameters]) async {
    try {
      final resp = await _dio.get(path, queryParameters: queryParameters);
      return resp.data;
    } catch (e) {
      throw ('Error en el Get ', e);
    }
  }
}
