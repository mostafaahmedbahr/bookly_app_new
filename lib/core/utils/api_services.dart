import 'package:dio/dio.dart';


class ApiServices
{
  static Dio? dio;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://www.googleapis.com/books/v1/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String ,dynamic>? query,
    String? token,
  }) async
  {
    dio!.options.headers=
    {
      "Accept":"application/json",
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }



  static Future<Response> postData({
    required String url,
    dynamic data,
    String? token,
  })async
  {
    dio!.options.headers=
    {
      "Accept":"application/json",
      "Content-Type" :"application/json",
    };
    return   await dio!.post(
      url,
      data: data,
    );

  }

  static Future<Response> putData({
    required String url,
    Map<String ,dynamic>? query,
    required Map<String,dynamic> data,
    String lang = "en",
    String? token,
  })async
  {
    dio!.options.headers=
    {
      "Accept":"application/json",
    };
    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String ,dynamic>? query,
    required Map<String,dynamic> data,
    String? token,
  })async
  {
    dio!.options.headers=
    {
      "Accept":"application/json",
    };
    return await dio!.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }

}