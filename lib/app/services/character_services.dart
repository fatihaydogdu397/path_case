import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:path_case/app/app_shelf.dart';

import '../../views/home/home_model.dart';

class CharacterServices {
  NetworkManager networkManager = NetworkManager.instance;

  Future<HomeModel?> getCharacter(int offset) async {
    try {
      final res = await NetworkManager.instance.getRequest(
          params:
              '?limit=${AppConstants.maxLimit}&offset=${AppConstants.maxLimit * offset}&ts=${AppConstants.ts}&apikey=${AppConstants.apikey}&hash=${AppConstants.md5Hash}');
      if (res.statusCode == 200) {
        final data = res.data;
        if (data is Map<String, dynamic>) {
          return HomeModel.fromJson(data);
        }
      }
    } on DioError catch (e) {
      log(e.toString());
    }
    return null;
  }
}
