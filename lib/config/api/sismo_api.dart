import 'package:dio/dio.dart';
import 'package:sismo/config/api/errors/custom_error.dart';

class SismoApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    _dio.options.baseUrl = 'http://localhost:9090/api';
    _dio.options.headers = {
      'Content-Type': 'multipart/form-data;',
    };
  }

  static Future httpGet(String path, [queryParameters]) async {
    try {
      final resp = await _dio.get(path, queryParameters: queryParameters);
      return resp;
    } catch (e) {
      throw ('Error en la peticion GET ', e);
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    final fromdata = FormData.fromMap(data);
    try {
      final resp = await _dio.put(path, data: fromdata);
      return resp;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(
            message: e.response?.data['message'],
            statusCode: e.response?.data['statusCode']);
      }
      throw ('Error en la peticion PUT ', e);
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final fromdata = FormData.fromMap(data);
    try {
      final resp = await _dio.post(path, data: fromdata);
      return resp;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(
            message: e.response?.data['message'],
            statusCode: e.response?.data['statusCode']);
      }
      throw ('Error en la peticion PUT ', e);
    }
  }
}
