

import 'package:dio/dio.dart';

Dio dio(){
  var dio = Dio();

  dio.options.baseUrl = "http://127.0.0.1:8000/api";
  dio.options.headers['Accept'] = 'application/json';
  return dio;
}