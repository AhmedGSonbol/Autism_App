
import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        // baseUrl: 'https://autisociety-api.original-business.com/api/',
        baseUrl: 'https://57b3-197-63-235-225.ngrok-free.app/api/',
        receiveDataWhenStatusError: true,
        validateStatus: (int? status) {
          return status != null;
          // return status != null && status >= 200 && status < 300;
        },
      )
    );
    dio!.interceptors.addAll([
      ErrorInterceptor(),
    ]);
  }





  static Future<Response>? getData({
    required String url,
    Map<String , dynamic>? query,
    var data = '',

    String? token,
  })async
  {
    dio!.options.headers =
    {
      'Content-Type':'application/json',
      'Authorization' : token??''
    };

    return await dio!.get(
      url ,
      queryParameters: query,
      data: data

    );
  }



  static Future<Response>? postData({
    required String url,
    required var data,

    bool contentType = false,
    Map<String , dynamic>? query,
    String? token,

  })async
  {

    dio!.options.headers =
    {
      'Content-Type':contentType == false ? 'application/json' : 'multipart/form-data',
      'Authorization' : token??''
    };

    return await dio!.post(
        url,
        queryParameters: query,
        data: data,

    );
  }

  static Future<Response>? putData({
    required String url,
    required Map<String , dynamic> data,

    Map<String , dynamic>? query,
    String? token,

  })async
  {

    dio!.options.headers =
    {
      'Content-Type':'application/json',
      'Authorization' : token??''
    };

    return await dio!.put(
        url,
        queryParameters: query,
        data: data

    );
  }

  static Future<Response>? deleteData({
    required String url,
    required var data,

    bool contentType = false,
    Map<String , dynamic>? query,
    String? token,

  })async
  {

    dio!.options.headers =
    {
      'Content-Type':contentType == false ? 'application/json' : 'multipart/form-data',
      'Authorization' : token??''
    };

    return await dio!.delete(
      url,
      queryParameters: query,
      data: data,

    );
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final isValid = status != null && status >= 200 && status < 300;
    if (!isValid) {
      throw DioException.badResponse(
        statusCode: status!,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
    super.onResponse(response, handler);
  }
}