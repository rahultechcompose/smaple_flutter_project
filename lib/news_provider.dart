import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sample_flutter_app/news_data.dart';

import 'comman_export.dart';

class NewsProvider {
  final baseurl = "https://api.first.org/data/v1/news/";
  final Dio _dio = getIt<Dio>();

  Future<Result<NewsResponse, String>> getNews() async {
    try {
      final response = await _dio.get(baseurl);
      return Result.success(
          NewsResponse.fromJson(response.data as Map<String, dynamic>));
    } catch (error, stacktrace) {
      log("stacktrace ${stacktrace.toString()}");
      return Result.error(handleError(error as DioError));
    }
  }
}
