import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_case/app/app_shelf.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();

  late Dio dio;
  // final String contentType = 'application/json';
  static NetworkManager get instance => _instance;

  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
  }

  Future<dynamic> getRequest({required String params}) async {
    try {
      final res = await dio.get(params);
      return res;
    } on DioError {
      rethrow;
    }
  }
}
