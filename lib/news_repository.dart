import 'package:sample_flutter_app/news_provider.dart';
import 'comman_export.dart';
import 'news_data.dart';

class NewsRepository {
  NewsProvider newsProvider = getIt<NewsProvider>();

  Future<Result<NewsResponse, String>> getNews() {
    return newsProvider.getNews();
  }
}
