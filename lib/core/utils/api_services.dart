import 'package:dio/dio.dart';


  class ApiServices
{
    final Dio? dio;
    final   baseUrl = "https://www.googleapis.com/books/v1/";

    ApiServices(this.dio);

    Future<Map<String, dynamic>> getData({
    required String url,
  }) async
  {
     var response = await dio!.get("$baseUrl$url");
     return response.data;
  }





}