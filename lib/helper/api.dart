import 'dart:developer';
import 'package:dio/dio.dart';

class Api {
  final Dio dio = Dio();
  Future<dynamic> get(String url) async {
    try{
      Response response = await dio.get(url);

      return response.data['data'];
    }
    on DioException catch (e) {
      log('ERROR: $e');
      throw('Failed, try again later dio exception');
    }
  }

  Future<dynamic> post({required String url, required dynamic body, required String token}) async{
    try{
      Response response = await dio.post(
          url,
          data: body,
          options: Options(
              headers: {
                "Authorization": "Bearer $token",
              }
          )
      );
      return response.data['data'];
    }
    on DioException catch (e) {
      log('ERROR: $e');
      throw('Failed, try again later dio exception');
    }
  }
}
