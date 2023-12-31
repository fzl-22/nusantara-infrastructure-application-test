import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkService {
  static final _dio = Dio();

  static Future<dynamic> post({
    required String endpoint,
    required Map body,
  }) async {
    final requestBody = jsonEncode(body);

    try {
      final response = await _dio.post(
        endpoint,
        data: requestBody,
        options: Options(
          followRedirects: false,
          maxRedirects: 0,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          validateStatus: (status) => status! < 500,
        ),
      );

      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  static Future<dynamic> delete({
    required String endpoint,
    required String token,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) => status! < 500,
        ),
      );

      return response.data;
    } catch (error) {
      rethrow;
    }
  }
}
