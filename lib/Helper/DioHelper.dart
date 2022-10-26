import 'package:dio/dio.dart';
import 'package:flutter_coins/App/app.dart';
import 'package:flutter_coins/utils/constant/constant.dart';

Dio DioHelper() {
  Dio dio = Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = 5000;
  dio.options.headers = {'X-Client-Device-UDID':App.udid};
  return dio;
}
