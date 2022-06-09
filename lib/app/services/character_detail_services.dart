import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:path_case/app/app_shelf.dart';

import '../../views/char_detail/char_detail_model.dart';

class CharacterDetailServices {
  NetworkManager networkManager = NetworkManager.instance;

  Future<CharDetailModel?> getCharDetails(int? id) async {
    try {
      final res = await networkManager.getRequest(
          params:
              '/$id/comics?format=${AppConstants.formatComic}&formatType=${AppConstants.formatComicType}&dateRange=${AppConstants.range}&offset=${AppConstants.offsetComic}&limit=${AppConstants.limitComic}&apikey=${AppConstants.apikey}&ts=${AppConstants.ts}&hash=${AppConstants.md5Hash}');

      if (res.statusCode == 200) {
        final data = res.data;
        if (data is Map<String, dynamic>) {
          return CharDetailModel.fromMap(data);
        }
      }
    } on DioError catch (e) {
      log(e.toString());
    }
    return null;
  }
}
