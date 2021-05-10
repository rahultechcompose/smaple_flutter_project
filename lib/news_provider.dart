import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sample_flutter_app/news_data.dart';
import 'comman_export.dart';

class NewsProvider {
  final base_url = "https://api.first.org/data/v1/news";
  final Dio _dio = getIt<Dio>();

  Future<Result<NewsResponse, String>> getNews() async {
    try {
      Response response = await _dio.get(base_url);
      return Result.success(
          NewsResponse.fromJson(response.data as Map<String, dynamic>));
    } catch (error, stacktrace) {
      return Result.error(handleError(error as DioError));
    }
  }
}
