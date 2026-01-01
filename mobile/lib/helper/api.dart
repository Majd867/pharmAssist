import 'dart:developer';
import 'package:dio/dio.dart';

class Api {
  final Dio dio = Dio();
  Future<dynamic> get(String url, String? token) async {
    try {
      Response response = await dio.get(
        url,
        options: Options(headers: {
          "Authorization": 'Bearer $token',
        }),
      );

      log('API response: ${response.data}');
      return response.data['data'];
    } on DioException catch (e) {
      log('DIO ERROR: ${e.response?.statusCode} - ${e.response?.data}');
      throw 'Request failed: ${e.response?.statusCode} - ${e.message}';
    }
  }


  Future<dynamic> post({
    required String url,
    required dynamic body,
  }) async {
    try {
      Response response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        log('Dio ERROR: ${e.response!.statusCode}');
        log('Dio ERROR DATA: ${e.response!.data}');
      } else {
        log('Dio ERROR: ${e.message}');
      }
      throw ('Failed, try again later dio exception');
    }
  }
}
