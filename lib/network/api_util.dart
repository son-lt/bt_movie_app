import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/network/api_client.dart';
import 'package:bt_movie_app/network/api_interceptors.dart';
import 'package:dio/dio.dart';

class ApiUtil {
  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = AppConfigs.timeout;
      dio!.interceptors.add(ApiInterceptors());
    }
    return dio!;
  }

  static ApiClient get apiClient {
    final apiClient = ApiClient(getDio());
    return apiClient;
  }
}