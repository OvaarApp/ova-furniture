import 'package:dio/dio.dart';

class HttpService {
  final Dio dio;

  HttpService(): dio = Dio(
    BaseOptions(baseUrl: '',
      headers: {
        'Accept': 'application/json',
      },
      followRedirects: false,
      contentType: 'application/json',
    ),
  ){
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options,handler) async{
          options.followRedirects = false;
          return handler.next(options);
        }
    ));
}}